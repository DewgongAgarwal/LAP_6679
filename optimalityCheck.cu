#include <cuda.h>
#include <stdint.h>
#include <limits.h>

__global__ void optimal(int32_t* Ar, int32_t* Vr, int32_t* countsSum, int32_t size) {
    __shared__ int32_t count[32];
    int32_t index = threadIdx.x;
    int32_t i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i < size) {
        int32_t copyArr = Ar[i];
        count[threadIdx.x] = copyArr != -1 ? 1 : 0;
        Vr[i] = copyArr != -1 ? 1 : 0; 
    } else {
        count[threadIdx.x] = 0;
    }
    for(int32_t stride = blockDim.x / 2; stride >= 1; stride /= 2) {
        __syncthreads();
        if (index < stride) {
            count[index] += count[index + stride];
        }
    }
    if(index == 0) {
        countsSum[blockIdx.x] = count[0];
    }
}

__global__ void sumKernel(int32_t* sum, int32_t* newSum, int32_t size) {
    __shared__ int32_t partial[32];
    int32_t index = threadIdx.x;
    int32_t i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i < size) {
        partial[threadIdx.x] = sum[i]; 
    } else {
        partial[threadIdx.x] = 0;
    }
    for(int32_t stride = blockDim.x / 2; stride >= 1; stride /= 2) {
        __syncthreads();
        if (index < stride) {
            partial[index] += partial[index + stride];
        }
    }
    if(index == 0) {
        newSum[blockIdx.x] = partial[0];
    }
}