#include <cuda.h>
#include <stdint.h>

__global__ void augmentInit(int32_t* augment, int32_t size) {
    int32_t j = blockIdx.x * blockDim.x + threadIdx.x;
    if (j < size) {
        augment[j] = 0;
    }
}

__global__ void reverseKernel(int32_t* reverse, int32_t* Pr, int32_t* Pc, 
    int32_t* Sr, int32_t* Sc, int32_t* augment, int32_t size) {
    
    int32_t j = blockIdx.x * blockDim.x + threadIdx.x;

    if (j < size && reverse[j] == 1) {
        int32_t rcur = - 1;
        int32_t ccur = j;
        while (ccur != -1) {
            Sc[ccur] = rcur;
            rcur = Pc[ccur];
            Sr[rcur] = ccur;
            ccur = Pr[rcur];
        }
        augment[rcur] = 1;
    }

}
