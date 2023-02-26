#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "rowReduction.cu"
#include "optimalityCheck.cu"
#include "passKernel.cu"
#include "augmentKernel.cu"
#include "dualUpdate.cu"
#include <sys/time.h>

typedef struct {
    struct timeval startTime;
    struct timeval endTime;
} Timer;


Timer timer;
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

  __host__ void printArray(double* a, int32_t size) {
    for(int32_t i = 0; i < size; i++) {
        printf("%lf, ", a[i]);
    }
    printf("\n");
  }
  
  __global__ void frontierInit(int32_t* frontier, int32_t* Ar, int32_t workers) {
        int32_t i = blockIdx.x * blockDim.x + threadIdx.x;
        if(i < workers) {
            frontier[i] = Ar[i] == -1;
        }
  }
  
  __global__ void visitedUpdate(int32_t* visited, int32_t* frontier, int32_t workers) {
    int32_t i = blockIdx.x * blockDim.x + threadIdx.x;
    if(i < workers) {
        visited[i] = visited[i] || frontier[i];
    }
}

  __host__ void generateCosts(int32_t** costs, int32_t workers, int32_t limit) {
      for(int32_t i = 0; i < workers; i++) {
          for(int32_t j = 0; j < workers; j++) {
              costs[i][j] = rand() % limit;
          }
      }
  }
  
  __host__ void flatten(int32_t** costs, int32_t workers, int32_t* costsRowwise, int32_t* costsColWise) {
      for(int32_t i = 0; i < workers; i++) {
          for(int32_t j = 0; j < workers; j++) {
              costsRowwise[i * workers + j] = costs[i][j];
              costsColWise[i * workers + j] = costs[j][i];
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

__global__ void copyKernel(int32_t* dest, int32_t* src, int32_t size) {
    int32_t i = blockIdx.x * blockDim.x + threadIdx.x;
    if(i < size) {
        dest[i] = src[i];
    }
}

  __host__ void declareAndInitialize(int32_t** a, int32_t initialValue, int32_t initialValueGiven, int32_t size) {
      cuda_ret = cudaMalloc((void**) a, sizeof(int32_t) * size);
      if(cuda_ret != cudaSuccess) FATAL("Unable to allocate device memory");
      if(initialValueGiven == 1) {
            int32_t threads = 32;
            int32_t blocks = (size + threads - 1) / threads;
            initialize<<<blocks, threads>>>(*a, initialValue, size);
      }
  }

    __host__ void declareAndInitialize(double** a, double initialValue, int32_t initialValueGiven, int32_t size) {
        cuda_ret = cudaMalloc((void**) a, sizeof(double) * size);
        if(cuda_ret != cudaSuccess) FATAL("Unable to allocate device memory");
        if(initialValueGiven == 1) {
            int32_t threads = 32;
            int32_t blocks = (size + threads - 1) / threads;
            initialize<<<blocks, threads>>>(*a, initialValue, size);
      }
    }

  __host__ void optimalityCheck(int32_t* countsSum, int32_t* newCountSums, int32_t* Ar, int32_t* Vr, double* slacks, int32_t* matchCount, int32_t workers) {
        int32_t threads = 32;
        int32_t blocks = (workers + threads - 1) / threads;
        int32_t flag = -1;
        optimal<<<blocks, threads>>>(Ar, Vr, countsSum, workers);
        int32_t lengthOfCountSum = blocks;

        while(lengthOfCountSum > 1) {
            blocks = (lengthOfCountSum + threads - 1) / threads;
            sumKernel<<<blocks, threads>>>(countsSum, newCountSums, lengthOfCountSum);
            lengthOfCountSum /= threads;
            flag = 0;
            if (lengthOfCountSum > 1) {
                blocks = (lengthOfCountSum + threads - 1) / threads;
                sumKernel<<<blocks, threads>>>(newCountSums, countsSum, lengthOfCountSum);
                lengthOfCountSum /= threads;
                flag = 1;
            }
        }
        if (flag * flag == 1) {
            cuda_ret = cudaMemcpy(matchCount, countsSum, sizeof(int32_t), cudaMemcpyDeviceToHost);
        } else {
            cuda_ret = cudaMemcpy(matchCount, newCountSums, sizeof(int32_t), cudaMemcpyDeviceToHost);
        }
        if(cuda_ret != cudaSuccess) FATAL("Unable to copy memory to the host for matchcount");
    }   

  __host__ void getMinSlack(double* slack, double* newSlack, double* newSlack2, int32_t workers, double* minSlack) {
        int32_t threads = 32;
        int32_t blocks = (workers + threads - 1) / threads;
        int32_t flag = -1;
        int32_t lengthOfCountSum = workers;
        double* slack2 = (double*) calloc(workers, sizeof(double));
        minKernel<<<blocks, threads>>>(slack, newSlack, lengthOfCountSum);
        cudaDeviceSynchronize();
        cudaMemcpy(slack2, newSlack, sizeof(double) * workers, cudaMemcpyDeviceToHost);
        lengthOfCountSum = blocks;
        while(lengthOfCountSum > 1) {
            blocks = (lengthOfCountSum + threads - 1) / threads;
            minKernel<<<blocks, threads>>>(newSlack, newSlack2, lengthOfCountSum);
            lengthOfCountSum /= threads;
            flag = 0;
            if (lengthOfCountSum > 1) {
                blocks = (lengthOfCountSum + threads - 1) / threads;
                minKernel<<<blocks, threads>>>(newSlack2, newSlack, lengthOfCountSum);
                lengthOfCountSum /= threads;
                flag = 1;
            }
        }
        free(slack2);
        if (flag * flag == 1) {
            cuda_ret = cudaMemcpy(minSlack, newSlack, sizeof(double), cudaMemcpyDeviceToHost);
        } else {
            cuda_ret = cudaMemcpy(minSlack, newSlack2, sizeof(double), cudaMemcpyDeviceToHost);
        }
        if(cuda_ret != cudaSuccess) FATAL("Unable to copy memory to the host for min-Slack");
  }

  void generateCosts(int32_t** costs, int32_t workers) {
    for(int32_t i = 0; i < workers; i++) {
        for(int32_t j = 0; j < workers; j++) {
            costs[i][j] = rand() % workers;
        }
    }
}
  
  int main() {
      int32_t workers = 8192 * 2;
    //   int32_t array[25] = {9, 22, 58, 11, 19, 43, 78, 72, 50, 63, 41, 28, 91, 37, 45, 74, 42, 27, 49, 39, 36, 11, 57, 22, 25};
      int32_t** costs = (int32_t**)calloc(workers, sizeof(int32_t*));
      for(int32_t i = 0; i < workers; i++) {
          costs[i] = (int32_t*)calloc(workers, sizeof(int32_t));
        //   for (int32_t j = 0; j < workers; j++) {
        //       costs[i][j] = array[i * workers + j];
        //   }
        }
        generateCosts(costs, workers);
      
        startTime(&timer);
      int32_t* costsRowwise_h = (int32_t*)calloc(workers * workers, sizeof(int32_t));
      int32_t* costsColwise_h = (int32_t*)calloc(workers * workers, sizeof(int32_t));
      flatten(costs, workers, costsRowwise_h, costsColwise_h);
      printf("Workers: %d\n", workers);
      // declareAndInitialize on device
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
      int32_t* newCountSums;


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

      declareAndInitialize(&Dr, 0, 1, workers);
      declareAndInitialize(&Dc, 0, 1, workers);

      declareAndInitialize(&Ar, -1, 1, workers);
      declareAndInitialize(&Ac, -1, 1, workers);

      declareAndInitialize(&Vr, 0, 1, workers);
      declareAndInitialize(&Vc, 0, 1, workers);

      declareAndInitialize(&Pc, -1, 1, workers);
      declareAndInitialize(&Pr, -1, 1, workers);

      declareAndInitialize(&Sc, -1, 1, workers);
      declareAndInitialize(&Sr, -1, 1, workers);

      declareAndInitialize(&slacks, INT_MAX, 1, workers);
      declareAndInitialize(&newSlack, 0, 1, workers);
      declareAndInitialize(&newSlack2, 0, 1, workers);

      declareAndInitialize(&frontier, 1, 1, workers);
      declareAndInitialize(&newFrontier, 0, 1, workers);  

      declareAndInitialize(&reverse, 0, 1, workers);
      declareAndInitialize(&augment, 0, 1, workers);

      declareAndInitialize(&visited, 0, 1, workers);

      declareAndInitialize(&countsSum, 0, 1, blocks);
      declareAndInitialize(&newCountSums, 0, 1, blocks);

      // copy to device
      cuda_ret = cudaMemcpy(costsRowwise_d, costsRowwise_h, sizeof(int32_t) * workers * workers, cudaMemcpyHostToDevice);
      if(cuda_ret != cudaSuccess) FATAL("Unable to copy memory to the device for Row-wise");
      cuda_ret = cudaMemcpy(costsColwise_d, costsColwise_h, sizeof(int32_t) * workers * workers, cudaMemcpyHostToDevice);
      if(cuda_ret != cudaSuccess) FATAL("Unable to copy memory to the device for Col-wise");
  
      findRowMin<<<blocks, threads>>>(costsRowwise_d, Dr, Dc, workers);
      cudaDeviceSynchronize();
      findRowMin<<<blocks, threads>>>(costsColwise_d, Dc, Dr, workers);
      cudaDeviceSynchronize();
      
      int32_t flag = 0;
      int32_t* matchCount = (int32_t*) calloc(1, sizeof(int32_t));
      int32_t* lengthOfFrontier_h = (int32_t *)calloc(1, sizeof(int32_t));
      int32_t* lengthOfReverse_h = (int32_t *)calloc(1, sizeof(int32_t));
      int32_t* Ar_h = (int32_t*)calloc(workers, sizeof(int32_t));
      double* thetaCopy = (double*)calloc(1, sizeof(double));

      *lengthOfFrontier_h = 1;
      do {
        cudaMemset(Vc, 0, sizeof(int32_t) * workers);
        cudaMemset(Vr, 0, sizeof(int32_t) * workers);
        initialize<<<blocks, threads>>>(Pc, -1, workers);
        initialize<<<blocks, threads>>>(Pr, -1, workers);
        initialize<<<blocks, threads>>>(Sr, -1, workers);
        initialize<<<blocks, threads>>>(Sc, -1, workers);
        cudaDeviceSynchronize();
        optimalityCheck(countsSum, newCountSums, Ar, Vr, slacks, matchCount, workers);
        initialize<<<blocks, threads>>>(slacks, INT_MAX, workers);
        cudaDeviceSynchronize();
        if (*matchCount == workers) {
            printf("Optimal solution found\n");
            cudaMemcpy(Ar_h, Ar, sizeof(int32_t) * workers, cudaMemcpyDeviceToHost);
            printArray(Ar_h, workers);
            break;
        } else {
            do {
                flag = 0;
                frontierInit<<<blocks, threads>>>(frontier, Ar, workers);
                cudaDeviceSynchronize();
                cudaMemset(visited, 0, sizeof(int32_t) * workers);
                cudaDeviceSynchronize();
                while(*lengthOfFrontier_h != 0) {
                    cudaMemset(countNewFrontier, 0, sizeof(int32_t));
                    cudaMemset(countReverse, 0, sizeof(int32_t));
                    forward<<<blocks, threads>>>(frontier, costsColwise_d, Dr, Dc, Ac, Vr, Vc, slacks, Pr, Pc, workers, newFrontier, reverse, countNewFrontier, countReverse, visited);
                    cudaDeviceSynchronize();

                    visitedUpdate<<<blocks, threads>>>(visited, frontier, workers);
                    cudaDeviceSynchronize();

                    cudaMemset(frontier, 0, sizeof(int32_t) * workers);
                    cudaMemcpy(lengthOfFrontier_h, countNewFrontier, sizeof(int32_t), cudaMemcpyDeviceToHost);
                    cudaDeviceSynchronize();
                    if (*lengthOfFrontier_h == 0) {
                        flag = 1;
                        break;
                    }
                    cudaMemset(countNewFrontier, 0, sizeof(int32_t));
                    cudaMemset(countReverse, 0, sizeof(int32_t));
                    cudaDeviceSynchronize();
                    forward<<<blocks, threads>>>(newFrontier, costsColwise_d, Dr, Dc, Ac, Vr, Vc, slacks, Pr, Pc, workers, frontier, reverse, countNewFrontier, countReverse, visited);
                    cudaDeviceSynchronize();
                    visitedUpdate<<<blocks, threads>>>(visited, newFrontier, workers);
                    cudaDeviceSynchronize();
                    cudaMemset(newFrontier, 0, sizeof(int32_t) * workers);
                    cudaDeviceSynchronize();
                    cudaMemcpy(lengthOfFrontier_h, countNewFrontier, sizeof(int32_t), cudaMemcpyDeviceToHost);
                    cudaDeviceSynchronize();
                    flag = 0;
                }
                
                cudaMemcpy(lengthOfReverse_h, countReverse, sizeof(int32_t), cudaMemcpyDeviceToHost);
                cudaDeviceSynchronize();
                if(*lengthOfReverse_h == 0) {
                    break;
                }
                reverseKernel<<<blocks, threads>>>(reverse, Pr, Pc, Sr, Sc, augment, workers);
                cudaDeviceSynchronize();
                augmentKernel<<<blocks, threads>>>(augment, Sr, Sc, Ar, Ac, workers);
                cudaDeviceSynchronize();
                cudaMemset(Vc, 0, sizeof(int32_t) * workers);
                cudaMemset(Vr, 0, sizeof(int32_t) * workers);
                initialize<<<blocks, threads>>>(Pc, -1, workers);
                initialize<<<blocks, threads>>>(Pr, -1, workers);
                initialize<<<blocks, threads>>>(Sr, -1, workers);
                initialize<<<blocks, threads>>>(Sc, -1, workers);
                cudaDeviceSynchronize();
                optimalityCheck(countsSum, newCountSums, Ar, Vr, slacks, matchCount, workers);
                initialize<<<blocks, threads>>>(slacks, INT_MAX, workers);
                cudaDeviceSynchronize();
                if (*matchCount == workers) {
                    break;
                } else {
                    getMinSlack(slacks, newSlack, newSlack2, workers, thetaCopy);
                    cudaMemset(countNewFrontier, 0, sizeof(int32_t));
                    cudaDeviceSynchronize();
                    if (flag == 1){
                        dualUpdate<<<blocks, threads>>>(*thetaCopy, Vr, Vc, Pc, Dr, Dc, slacks, workers, newFrontier, countNewFrontier);
                        cudaDeviceSynchronize();
                        copyKernel<<<blocks, threads>>>(frontier, newFrontier, workers);
                        cudaDeviceSynchronize();
                    } else {
                        dualUpdate<<<blocks, threads>>>(*thetaCopy, Vr, Vc, Pc, Dr, Dc, slacks, workers, frontier, countNewFrontier);
                        cudaDeviceSynchronize();
                    }
                    cudaMemcpy(lengthOfFrontier_h, countNewFrontier, sizeof(int32_t), cudaMemcpyDeviceToHost);
                }
                cudaMemset(augment, 0, sizeof(int32_t) * workers);
                cudaMemset(reverse, 0, sizeof(int32_t) * workers);
                cudaDeviceSynchronize();
            } while(1);
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
      cudaFree(newCountSums);
      
      for(int32_t i = 0; i < workers; i++) {
          free(costs[i]);
      }
      printArray(matchCount, 1);
      stopTime(&timer); printf("%f s\n", elapsedTime(timer));
      free(costs);
      free(costsRowwise_h);
      free(costsColwise_h);
      free(matchCount);
      free(lengthOfFrontier_h);
      free(lengthOfReverse_h);
      free(Ar_h);
      free(thetaCopy);
      return 0;
  }
  
