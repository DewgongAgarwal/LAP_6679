#include <stdint.h>
#include <cuda.h>
#include <limits.h>
#include <math.h>

__global__ void minKernelFirst(int32_t* min, int32_t* newMin, int32_t size, int32_t workers, int32_t* coveredCols, int32_t* coveredRows) {
    __shared__ int32_t partial[512];
    int32_t index = threadIdx.x;
    int32_t i = blockIdx.x * blockDim.x + threadIdx.x;
    int32_t col = i / workers;
    int32_t row = i % workers;
    
    int32_t x = 0;
    int32_t y = 0;
    int32_t temp = 0;
    if (i < size) {
        if (coveredCols[col] == 0 && coveredRows[row] == 0) {
            temp = min[i];
        } else {
            temp = INT_MAX;
        }
        partial[threadIdx.x] = (temp > 0) * temp + (1 - temp > 0) * INT_MAX; 
    } else {
        partial[threadIdx.x] = INT_MAX;
    }
    for(int32_t stride = blockDim.x / 2; stride >= 1; stride /= 2) {
        __syncthreads();

        if (index < stride) {
            x = partial[index];
            y = partial[index + stride];
            partial[index] = y ^ ((x ^ y) & -(x < y));
        }
    }
    if(index == 0) {
        newMin[blockIdx.x] = partial[index];
    }
}

__global__ void minKernel(int32_t* min, int32_t* newMin, int32_t size) {
    __shared__ int32_t partial[256];
    int32_t index = threadIdx.x;
    int32_t i = blockIdx.x * blockDim.x + threadIdx.x;
    int32_t x = 0;
    int32_t y = 0;
    if (i < size) {
        int32_t temp = min[i];
        partial[threadIdx.x] = (temp > 0) * temp + (1 - temp > 0) * INT_MAX; 
    } else {
        int32_t temp = min[0];
        partial[threadIdx.x] = (temp > 0) * temp + (1 - temp > 0) * INT_MAX;
    }
    for(int32_t stride = blockDim.x / 2; stride >= 1; stride /= 2) {
        __syncthreads();

        if (index < stride) {
            x = partial[index];
            y = partial[index + stride];
            partial[index] = y ^ ((x ^ y) & -(x < y));
        }
    }
    if(index == 0) {
        newMin[blockIdx.x] = partial[index];
    }
}

__host__ void getMinSlack(int32_t* slack, int32_t* newSlack, int32_t* newSlack2, int32_t workers, int32_t n, int32_t* minSlack, int32_t* coveredCols, int32_t* coveredRows) {
    int32_t threads = 256;
    int32_t threadsBig = 512;
    int32_t blocks = (workers + threadsBig - 1) / threadsBig;
    int32_t flag = -1;
    int32_t lengthOfCountSum = workers;

    minKernelFirst<<<blocks, threadsBig>>>(slack, newSlack, lengthOfCountSum, n, coveredCols, coveredRows);
    cudaDeviceSynchronize();
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

    if (flag * flag == 1) {
        cudaMemcpy(minSlack, newSlack, sizeof(int32_t), cudaMemcpyDeviceToHost);
    } else {
        cudaMemcpy(minSlack, newSlack2, sizeof(int32_t), cudaMemcpyDeviceToHost);
    }
}


__global__ void addSub(int32_t min, int32_t blocksStep4, int32_t* zeroesSizes, int32_t* allZeroesSize, int32_t workers, int32_t* slacks, int32_t* coveredRows, int32_t* coveredCols, int32_t size) {
    int32_t i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i < size) {
        int32_t row = i % workers;
        int32_t col = i / workers;
        int32_t covCol = coveredCols[col];
        int32_t covRow = coveredRows[row];
        if (covCol == 0 && covRow == 0) {
            slacks[i] -= min;
        } else if (covCol == 1 && covRow == 1) {
            slacks[i] += min;
        }
    }
    if (i == 0) *allZeroesSize = 0;
	if (i < blocksStep4) zeroesSizes[i] = 0;
}


__global__ void compressKernel(int32_t* slacks, int32_t* zeroes, int32_t* zeroesSizes, int32_t* allZeroesSize, int numberOfDataPerBlock, int32_t workers, int32_t size) {
    
    int32_t i = blockIdx.x * blockDim.x + threadIdx.x;
    int32_t offset = -1;
    if (i < size && slacks[i] == 0) {
        int32_t b = i / numberOfDataPerBlock;
        atomicAdd(allZeroesSize, 1);
        offset = atomicAdd(&(zeroesSizes[b]), 1);
        zeroes[b * numberOfDataPerBlock + offset] = i;
    }
}