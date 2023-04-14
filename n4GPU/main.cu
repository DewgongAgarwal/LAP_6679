#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/time.h>
#include "Step1.cu"
#include "Step2.cu"
#include "Step3.cu"
#include "Step4.cu"
#include "Step5.cu"
#include "Step6.cu"

typedef struct {
    struct timeval startTime;
    struct timeval endTime;
} Timer;

int32_t threads = 64;
int32_t bigThreads = 512;

Timer timer;
Timer timer1;
Timer timer2;
Timer timer3;
Timer timer4;
Timer timer5;
Timer timer6;
float step1Time = 0.0;
float step2Time = 0.0;
float step3Time = 0.0;
float step4Time = 0.0;
float step5Time = 0.0;
float step6Time = 0.0;


cudaError_t cuda_ret;

#define FATAL(_msg, ...) \
    do {\
      fprintf(stderr, "[%s:%d] " _msg "\n", __FILE__, __LINE__, ##__VA_ARGS__); \
      exit(-1);								\
    } while(0)

void startTime(Timer* timer) {
    gettimeofday(&(timer->startTime), NULL);
}

void stopTime(Timer* timer) {
    gettimeofday(&(timer->endTime), NULL);
}

float elapsedTime(Timer timer) {
    return ((float) ((timer.endTime.tv_sec - timer.startTime.tv_sec) \
                + (timer.endTime.tv_usec - timer.startTime.tv_usec)/1.0e6));
}

__host__ void printArray(int32_t* a, int32_t size) {
      for(int32_t i = 0; i < size; i++) {
          printf("%d, ", a[i]);
      }
      printf("\n");
  }

__host__ void printMatrix(int32_t** a, int32_t size) {
    for(int32_t i = 0; i < size; i++) {
        for(int32_t j = 0; j < size; j++) {
            printf("%d, ", a[i][j]);
        }
        printf("\n");
    }
    printf("\n");
}

__global__ void initialize(int32_t* a, int32_t initialValue, int32_t size) {
    int32_t i = blockIdx.x * blockDim.x + threadIdx.x;
    if(i < size) {
        a[i] = initialValue;
    }
}

  __host__ void flatten(int32_t** costs, int32_t workers, int32_t* costsRowwise) {
    for(int32_t i = 0; i < workers; i++) {
        for(int32_t j = 0; j < workers; j++) {
            costsRowwise[i * workers + j] = costs[i][j];
        }
    }
}

__host__ void unflatten(int32_t** costs, int32_t* cols, int32_t workers) {
    for(int32_t i = 0; i < workers; i++) {
        for(int32_t j = 0; j < workers; j++) {
            costs[j][i] = cols[i * workers + j];
        }
    }
}

__host__ void generateCosts(int32_t** costs, int32_t workers) {
    for(int32_t i = 0; i < workers; i++) {
        for(int32_t j = 0; j < workers; j++) {
            costs[i][j] = rand() % (workers * 10 + 1);
        }
    }
}

__host__ void declare(int32_t** a, int32_t size) {
    cuda_ret = cudaMalloc((void**) a, sizeof(int32_t) * size);
    if(cuda_ret != cudaSuccess) FATAL("Unable to allocate device memory");
}

int n4Hungarian(int32_t workers) {
    srand(0);
    printf("Workers: %d\n", workers);
    // int32_t array[16] = {9, 22, 58, 11, 43, 78, 72, 50, 41, 28, 91, 37, 74, 42, 27, 49};
    int32_t** costs = (int32_t**)calloc(workers, sizeof(int32_t*));
    for(int32_t i = 0; i < workers; i++) {
        costs[i] = (int32_t*)calloc(workers, sizeof(int32_t));
        // for (int32_t j = 0; j < workers; j++) {
        //     costs[i][j] = array[i * workers + j];
        // }
      }
      generateCosts(costs, workers);
    startTime(&timer);
    int32_t* costsRowwise_h = (int32_t*)calloc(workers * workers, sizeof(int32_t));
    int32_t* repeat = (int32_t*)calloc(1, sizeof(int32_t));
    int32_t* goToStep5 = (int32_t*)calloc(1, sizeof(int32_t));
    int32_t* numStarredZeroes_h = (int32_t*)calloc(1, sizeof(int32_t));
    int32_t* min = (int32_t*)calloc(1, sizeof(int32_t));
    int32_t* answers = (int32_t*)calloc(workers, sizeof(int32_t));
    int32_t* zeroesCopy = (int32_t*)calloc(1, sizeof(int32_t));

    flatten(costs, workers, costsRowwise_h);
    int32_t blocks = (workers + threads - 1) / threads;
    int32_t bigBlocks = (workers * workers + bigThreads - 1) / bigThreads;
    int32_t colPerBlock = 512;
    int32_t newSlackSize = (workers * workers + 512 - 1) / 512;
    int32_t newSlack2Size = (newSlackSize + 256 - 1) / 256;
    int32_t blocksStep2And4 = (workers + colPerBlock - 1) / colPerBlock;

    int32_t* rowMins_d;
    int32_t* colMins_d;
    int32_t* costsRowwise_d;
    int32_t* slacks;
    int32_t* newSlack;
    int32_t* newSlack2;
    int32_t* zeroes;
    int32_t* zeroesSizes_d;
    int32_t* allZeroesSize;
    int32_t* repeatKernel;
    int32_t* rowOfStarAtCol;
    int32_t* colOfStarAtRow;
    int32_t* coveredRows;
    int32_t* coveredCols;
    int32_t* colOfPrimeAtRow;
    int32_t* rowOfGreenAtCol;
    int32_t* numStarredZeroes;
    int32_t* goToStep5Kernel;
    declare(&rowMins_d, workers);
    declare(&colMins_d, workers);
    declare(&costsRowwise_d, workers * workers);
    declare(&slacks, workers * workers);
    declare(&newSlack, newSlackSize);
    declare(&newSlack2, newSlack2Size);
    declare(&zeroes, workers * workers);
    declare(&zeroesSizes_d, blocksStep2And4);
    declare(&allZeroesSize, 1);
    declare(&repeatKernel, 1);
    declare(&rowOfStarAtCol, workers);
    declare(&colOfStarAtRow, workers);
    declare(&coveredRows, workers);
    declare(&coveredCols, workers);
    declare(&colOfPrimeAtRow, workers);
    declare(&rowOfGreenAtCol, workers);
    declare(&numStarredZeroes, 1);
    declare(&goToStep5Kernel, 1);

    cudaMemset(allZeroesSize, 0, sizeof(int32_t));
    cudaMemset(repeatKernel, 0, sizeof(int32_t));
    cudaMemset(goToStep5Kernel, 0, sizeof(int32_t));
    cudaMemset(numStarredZeroes, 0, sizeof(int32_t));

    initialize<<<blocks, threads>>>(colMins_d, 0, workers);
    initialize<<<blocks, threads>>>(coveredRows, 0, workers);
    initialize<<<blocks, threads>>>(coveredCols, 0, workers);
    initialize<<<blocks, threads>>>(rowOfStarAtCol, -1, workers);
    initialize<<<blocks, threads>>>(colOfStarAtRow, -1, workers);
    initialize<<<(blocksStep2And4 + threads - 1) / threads, threads>>>(zeroesSizes_d, 0, blocksStep2And4);

    cudaMemcpy(costsRowwise_d, costsRowwise_h, sizeof(int32_t) * workers * workers, cudaMemcpyHostToDevice);
    transpose<<<bigBlocks, bigThreads>>>(costsRowwise_d, slacks, workers);
    startTime(&timer1);
    findRowMin<<<blocks, threads>>>(costsRowwise_d, rowMins_d, colMins_d, workers);
    
    findRowMin<<<blocks, threads>>>(slacks, colMins_d, rowMins_d, workers);
    

    
    subtractFromRow<<<bigBlocks, bigThreads>>>(slacks, rowMins_d, workers);
    
    subtractFromCol<<<bigBlocks, bigThreads>>>(slacks, colMins_d, workers);
    
    compressKernel<<<bigBlocks, bigThreads>>>(slacks, zeroes, zeroesSizes_d, allZeroesSize, colPerBlock * workers, workers, workers * workers);
    
    stopTime(&timer1);
    step1Time += elapsedTime(timer1);
    startTime(&timer2);
    do {
        *repeat = 0;
        cudaMemset(repeatKernel, 0, sizeof(int32_t));
        
        initialMatching<<<blocksStep2And4, colPerBlock>>>(rowOfStarAtCol, colOfStarAtRow, coveredRows, coveredCols, zeroes, zeroesSizes_d, repeatKernel, colPerBlock * workers, workers);
        
        cudaMemcpy(repeat, repeatKernel, sizeof(int32_t), cudaMemcpyDeviceToHost);
        
    } while(*repeat);
    stopTime(&timer2);
    step2Time += elapsedTime(timer2);

    do {
        startTime(&timer3);
        cudaMemset(numStarredZeroes, 0, sizeof(int32_t));
        searchInitialization<<<blocks, threads>>>(coveredRows, coveredCols, numStarredZeroes, workers);
        
        searchTermination<<<blocks, threads>>>(rowOfStarAtCol, coveredCols, numStarredZeroes, workers);
        
        cudaMemcpy(numStarredZeroes_h, numStarredZeroes, sizeof(int32_t), cudaMemcpyDeviceToHost);
        stopTime(&timer3);
        step3Time += elapsedTime(timer3);
        if (*numStarredZeroes_h == workers) {
            printf("Optimal Solution Found\n");
            cudaMemcpy(answers, colOfStarAtRow, sizeof(int32_t) * workers, cudaMemcpyDeviceToHost);
            int32_t sum = 0;
            for (int32_t j = 0; j < workers; j++) {
                sum += costs[j][answers[j]];
            }
            printf("Total cost: %d\n", sum);
            break;
        }
        
        initialize<<<blocks, threads>>>(colOfPrimeAtRow, -1, workers);
        initialize<<<blocks, threads>>>(rowOfGreenAtCol, -1, workers);
        

        while(true) {
            startTime(&timer4);
            do {
                cudaMemset(repeatKernel, 0, sizeof(int32_t));
                cudaMemset(goToStep5Kernel, 0, sizeof(int32_t));
                alternatingGraphPathSearch<<<blocksStep2And4, colPerBlock>>>(coveredRows, coveredCols, zeroes, zeroesSizes_d, colPerBlock * workers, workers, repeatKernel, goToStep5Kernel, colOfStarAtRow, colOfPrimeAtRow);
                
                cudaMemcpy(repeat, repeatKernel, sizeof(int32_t), cudaMemcpyDeviceToHost);
                cudaMemcpy(goToStep5, goToStep5Kernel, sizeof(int32_t), cudaMemcpyDeviceToHost);
                
            } while(*repeat && !(*goToStep5));
            stopTime(&timer4);
            step4Time += elapsedTime(timer4);
            if (*goToStep5) {
                break;
            }
            startTime(&timer6);
            getMinSlack(slacks, newSlack, newSlack2, workers * workers, workers, min, coveredCols, coveredRows);
            addSub<<<bigBlocks, bigThreads>>>(*min, blocksStep2And4, zeroesSizes_d, allZeroesSize, workers, slacks, coveredRows, coveredCols, workers * workers);
            
            compressKernel<<<bigBlocks, bigThreads>>>(slacks, zeroes, zeroesSizes_d, allZeroesSize, colPerBlock * workers, workers, workers * workers);
            
            stopTime(&timer6);
            step6Time += elapsedTime(timer6);
        }
        startTime(&timer5);
        removeOverlappingPaths<<<blocks, threads>>>(colOfPrimeAtRow, colOfStarAtRow, rowOfStarAtCol, rowOfGreenAtCol, workers);
        
        alternatingPaths<<<blocks, threads>>>(colOfStarAtRow, rowOfStarAtCol, rowOfGreenAtCol, workers);
        
        stopTime(&timer5);
        step5Time += elapsedTime(timer5);
    } while(true);
    stopTime(&timer); printf("Total Runtime: %f s\n", elapsedTime(timer));
    printf("Step 1 Runtime: %f s\n", step1Time);
    printf("Step 2 Runtime: %f s\n", step2Time);
    printf("Step 3 Runtime: %f s\n", step3Time);
    printf("Step 4 Runtime: %f s\n", step4Time);
    printf("Step 5 Runtime: %f s\n", step5Time);
    printf("Step 6 Runtime: %f s\n", step6Time);
    for(int32_t i = 0; i < workers; i++) {
        free(costs[i]);
    }
    free(costs);
    free(costsRowwise_h);
    free(repeat);
    free(goToStep5);
    free(numStarredZeroes_h);
    free(min);
    free(zeroesCopy);
    free(answers);

    cudaFree(rowMins_d);
    cudaFree(colMins_d);
    cudaFree(costsRowwise_d);
    cudaFree(slacks);
    cudaFree(newSlack);
    cudaFree(newSlack2);
    cudaFree(zeroes);
    cudaFree(zeroesSizes_d);
    cudaFree(allZeroesSize);
    cudaFree(repeatKernel);
    cudaFree(rowOfStarAtCol);
    cudaFree(colOfStarAtRow);
    cudaFree(coveredRows);
    cudaFree(coveredCols);
    cudaFree(colOfPrimeAtRow);
    cudaFree(rowOfGreenAtCol);
    cudaFree(numStarredZeroes);
    cudaFree(goToStep5Kernel);
    return 0;
}

int main() {
    for(int32_t i = 5; i < 15; i++) {
        n4Hungarian(1 << i);
        printf("\n\n");
    }
}
