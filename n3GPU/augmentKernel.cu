#include <cuda.h>
#include <stdint.h>

__global__ void augmentKernel(int32_t* aug, int32_t* Sr, int32_t* Sc, int32_t* Ar, 
    int32_t* Ac, int32_t size) {
    
    int32_t i = blockIdx.x * blockDim.x + threadIdx.x;
    int32_t rcur = i;
    int32_t ccur = -1;
    if (i < size && aug[i] != 0) {
        while (rcur != -1) {
            ccur = Sr[rcur];
            Ar[rcur] = ccur;
            Ac[ccur] = rcur;
            rcur = Sc[ccur];
        }
    }
    
}
