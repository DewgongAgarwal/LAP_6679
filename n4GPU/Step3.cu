#include <stdlib.h>
#include <cuda.h>
#include <stdbool.h>

//Step 3

__global__ void searchInitialization(int32_t* coveredRows, int32_t* coveredCols, int32_t* numStarredZeroes, int32_t size) {
    int32_t i = threadIdx.x + blockIdx.x * blockDim.x;
    if (i < size) {
        coveredRows[i] = 0;
        coveredCols[i] = 0;
    }
}

__global__ void searchTermination(int32_t* rowOfStarAtColumn, int32_t* coveredCols, int32_t* numStarredZeroes, int32_t size) {
    int32_t i = threadIdx.x + blockIdx.x * blockDim.x;
    if (i < size && rowOfStarAtColumn[i] >= 0) {
        coveredCols[i] = 1;
        atomicAdd(numStarredZeroes, 1);
    }
}