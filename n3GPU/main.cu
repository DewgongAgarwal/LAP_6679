#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/time.h>
#include "step6.cu"
#include "step5.cu"
#include "step4.cu"
#include "step3.cu"
#include "step2.cu"
#include "step1.cu"
#include <stdbool.h>

typedef struct {
    struct timeval startTime;
    struct timeval endTime;
} Timer;


Timer timer;
Timer timer1;
Timer timer2;
Timer timer3;
Timer timer4;
Timer timer5;
Timer timer6;
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

double elapsedTime(Timer timer) {
    return ((double) ((timer.endTime.tv_sec - timer.startTime.tv_sec) \
                + (timer.endTime.tv_usec - timer.startTime.tv_usec)/1.0e6));
}

__host__ void printArray(int32_t* a, int32_t size) {
      for(int32_t i = 0; i < size; i++) {
          printf("%d, ", a[i]);
      }
      printf("\n");
  }

  __host__ void printArray(double* a, int32_t size) {
    for(int32_t i = 0; i < size; i++) {
        printf("%lf, ", a[i]);
    }
    printf("\n");
  }
  
  __host__ void flatten(int32_t** costs, int32_t workers, int32_t* costsRowwise) {
      for(int32_t i = 0; i < workers; i++) {
          for(int32_t j = 0; j < workers; j++) {
              costsRowwise[i * workers + j] = costs[i][j];
          }
      }
  }

  __global__ void initialize(int32_t* a, int32_t initialValue, int32_t size) {
    int32_t i = blockIdx.x * blockDim.x + threadIdx.x;
    if(i < size) {
        a[i] = initialValue;
    }
}

__global__ void initialize(double* a, double initialValue, int32_t size) {
    int32_t i = blockIdx.x * blockDim.x + threadIdx.x;
    if(i < size) {
        a[i] = initialValue;
    }
}

  __host__ void declareAndInitialize(int32_t** a, int32_t initialValue, int32_t initialValueGiven, int32_t size) {
      cuda_ret = cudaMalloc((void**) a, sizeof(int32_t) * size);
      if(cuda_ret != cudaSuccess) FATAL("Unable to allocate device memory");
      if(initialValueGiven == 1) {
            int32_t threads = 256;
            int32_t blocks = (size + threads - 1) / threads;
            initialize<<<blocks, threads>>>(*a, initialValue, size);
      }
  }

    __host__ void declareAndInitialize(double** a, double initialValue, int32_t initialValueGiven, int32_t size) {
        cuda_ret = cudaMalloc((void**) a, sizeof(double) * size);
        if(cuda_ret != cudaSuccess) FATAL("Unable to allocate device memory");
        if(initialValueGiven == 1) {
            int32_t threads = 256;
            int32_t blocks = (size + threads - 1) / threads;
            initialize<<<blocks, threads>>>(*a, initialValue, size);
      }
    }

  void generateCosts(int32_t** costs, int32_t workers) {
    for(int32_t i = 0; i < workers; i++) {
        for(int32_t j = 0; j < workers; j++) {
            costs[i][j] = rand() % (workers / 10 + 1);
        }
    }
}
  
  int n3Hungarian(int32_t workers) {
    //srand(0);
    double step1Time = 0.0, step2Time = 0.0, step3Time = 0.0, step4Time = 0.0, step5Time = 0.0, step6Time = 0.0;
    int32_t** costs = (int32_t**)calloc(workers, sizeof(int32_t*));
    for(int32_t i = 0; i < workers; i++) {
        costs[i] = (int32_t*)calloc(workers, sizeof(int32_t));
    }
    generateCosts(costs, workers);
      
    startTime(&timer);
    int32_t* costsRowwise_h = (int32_t*)calloc(workers * workers, sizeof(int32_t));
    int32_t* answers = (int32_t*)calloc(workers, sizeof(int32_t));
    int32_t* repeat = (int32_t*)calloc(1, sizeof(int32_t));
    flatten(costs, workers, costsRowwise_h);
    printf("Workers: %d\n", workers);

    int32_t* costsRowwise_d;
    int32_t* costsColwise_d;
    double* Dr;
    double* Dc;
    int32_t* Ar;
    int32_t* Ac;
    int32_t* Vr;
    int32_t* Vc;
    int32_t* Pc;
    int32_t* Pr;
    int32_t* Sc;
    int32_t* Sr;
    double* slacks;
    double* newSlack;
    double* newSlack2;
    int32_t* frontier;
    int32_t* newFrontier;
    int32_t* reverse;
    int32_t* countNewFrontier;
    int32_t* countReverse;
    int32_t* augment;
    int32_t* visited;
    int32_t* countsSum;
    int32_t* lengthOfFrontier;
    int32_t* lengthOfNewFrontier;


    int32_t threads = 32;
    int32_t blocks = (workers + threads - 1) / threads;

    cuda_ret = cudaMalloc((void**) &countNewFrontier, sizeof(int32_t));
    if(cuda_ret != cudaSuccess) FATAL("Unable to allocate device memory");
    cudaMemset(countNewFrontier, 0, sizeof(int32_t));
    cuda_ret = cudaMalloc((void**) &countReverse, sizeof(int32_t));
    if(cuda_ret != cudaSuccess) FATAL("Unable to allocate device memory");
    cudaMemset(countReverse, 0, sizeof(int32_t));

    declareAndInitialize(&costsRowwise_d, 0, 0, workers * workers);
    declareAndInitialize(&costsColwise_d, 0, 0, workers * workers);

    declareAndInitialize(&Dr, 0, 0, workers);
    declareAndInitialize(&Dc, 0, 1, workers);

    declareAndInitialize(&Ar, -1, 1, workers);
    declareAndInitialize(&Ac, -1, 1, workers);

    declareAndInitialize(&Vr, 0, 0, workers);
    declareAndInitialize(&Vc, 0, 0, workers);

    declareAndInitialize(&Pc, -1, 0, workers);
    declareAndInitialize(&Pr, -1, 0, workers);

    declareAndInitialize(&Sc, -1, 0, workers);
    declareAndInitialize(&Sr, -1, 0, workers);

    declareAndInitialize(&slacks, 0, 0, workers);
    declareAndInitialize(&newSlack, 0, 0, workers);
    declareAndInitialize(&newSlack2, 0, 0, workers);

    declareAndInitialize(&frontier, 1, 0, workers);
    declareAndInitialize(&newFrontier, 0, 0, workers);  

    declareAndInitialize(&reverse, 0, 0, workers);
    declareAndInitialize(&augment, 0, 0, workers);

    declareAndInitialize(&visited, 0, 0, workers);

    declareAndInitialize(&countsSum, 0, 0, 1);

    declareAndInitialize(&lengthOfFrontier, 0, 1, 1);
    declareAndInitialize(&lengthOfNewFrontier, 0, 1, 1);
    
    bool done = false;
    int32_t performOptimalityCheck = 1;
    int32_t* matchCount = (int32_t*) calloc(1, sizeof(int32_t));
    int32_t* goToStep4 = (int32_t*)calloc(1, sizeof(int32_t));
    startTime(&timer1);
    step1(costsRowwise_d, costsColwise_d, costsRowwise_h, Dr, Dc, workers, blocks, threads);
    stopTime(&timer1);
    step1Time += elapsedTime(timer1);
    int32_t sum = 0;
    do {
        if (performOptimalityCheck) {
            startTime(&timer2);
            done = step2(Ar, Vr, countsSum, workers, Pc, Sr, Pr, Sc, Vc, slacks, matchCount, blocks, threads);
            stopTime(&timer2);
            step2Time += elapsedTime(timer2);
        }
        if (done) {
            printf("Optimal solution found\n");
            cudaMemcpy(answers, Ar, workers * sizeof(int32_t), cudaMemcpyDeviceToHost);
            for(int i = 0; i < workers; i++) {
                sum += costs[i][answers[i]];
            }
            printf("\n");
            printf("Cost: %d\n", sum);
            break;
        } 
        *goToStep4 = 0;
        startTime(&timer3);
        step3(frontier, costsColwise_d, Dr, Dc, Ar, Ac, Vr, Vc, slacks, Pr, Pc,
                workers, newFrontier, repeat, reverse, countNewFrontier, countReverse,
                visited, goToStep4, blocks, threads, performOptimalityCheck, 
                lengthOfFrontier, lengthOfNewFrontier);
        stopTime(&timer3);
        step3Time += elapsedTime(timer3);
        if(*goToStep4) {
            startTime(&timer4);
            step4(reverse, Pr, Pc, Sr, Sc, augment, workers, blocks, threads);
            stopTime(&timer4);
            step4Time += elapsedTime(timer4);
            startTime(&timer5);
            step5(augment, Sr, Sc, Ar, Ac, workers, blocks, threads);
            performOptimalityCheck = 1;
            stopTime(&timer5);
            step5Time += elapsedTime(timer5);
        } else {
            startTime(&timer6);
            step6(slacks, newSlack, newSlack2, workers, Vr, Vc, Pc, Dr, Dc, 
                frontier, countNewFrontier, blocks, threads, lengthOfFrontier);
            cudaMemcpy(&performOptimalityCheck, countNewFrontier, sizeof(int32_t), cudaMemcpyDeviceToHost);
            performOptimalityCheck = 1 - performOptimalityCheck;
            stopTime(&timer6);
            step6Time += elapsedTime(timer6);
        }
    } while(1);

    cudaFree(costsRowwise_d);
    cudaFree(costsColwise_d);
    cudaFree(Dr);
    cudaFree(Dc);
    cudaFree(Vr);
    cudaFree(Vc);
    cudaFree(Ar);
    cudaFree(Ac);
    cudaFree(Pc);
    cudaFree(Pr);
    cudaFree(Sc);
    cudaFree(Sr);
    cudaFree(slacks);
    cudaFree(newSlack);
    cudaFree(newSlack2);
    cudaFree(frontier);
    cudaFree(newFrontier);
    cudaFree(reverse);
    cudaFree(countNewFrontier);
    cudaFree(countReverse);
    cudaFree(augment);
    cudaFree(visited);
    cudaFree(countsSum);
    
    for(int32_t i = 0; i < workers; i++) {
        free(costs[i]);
    }
    printArray(matchCount, 1);
    stopTime(&timer); printf("%f s\n", elapsedTime(timer));
    printf("Step 1: %f s\n", step1Time);
    printf("Step 2: %f s\n", step2Time);
    printf("Step 3: %f s\n", step3Time);
    printf("Step 4: %f s\n", step4Time);
    printf("Step 5: %f s\n", step5Time);
    printf("Step 6: %f s\n", step6Time);
    free(costs);
    free(costsRowwise_h);
    free(matchCount);
    free(goToStep4);
    free(answers);
    free(repeat);
    return 0;
  }
  
int main() {
    for(int32_t i = 5; i < 15; i++) {
        n3Hungarian(1 << i);
        printf("\n\n");
    }
}
