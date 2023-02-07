#include <stdlib.h>
#include <cuda.h>
#include <stdbool.h>

//Step 3

__global__
void searchInitialization(bool* coveredRows, bool* coveredCols, int32_t* numStarredZeroes) {
    int32_t i = threadIdx.x + blockIdx.x * blockDim.x;
    coveredRows[i] = false;
    coveredCols[i] = false;
    if (blockIdx.x == 0 && threadIdx.x == 0) {
        *numStarredZeroes = 0;
    }
}

__global__
void searchTermination(bool* rowOfStarAtColumn, bool* coveredCols, int32_t* numStarredZeroes) {
    int32_t i = threadIdx.x + blockIdx.x * blockDim.x;
    if (rowOfStarAtColumn[i] != -1) {
        coveredCols[i] = true;
        atomicAdd(&numStarredZeroes, 1);
    }
}