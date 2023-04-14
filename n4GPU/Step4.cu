#include <stdlib.h>
#include <cuda.h>
#include <stdbool.h>


__global__ void alternatingGraphPathSearch(int32_t* coveredRows, int32_t* coveredCols, int32_t* zeroes, int32_t* zeroesSizes, int32_t numberOfDataPerBlock, int32_t workers, int32_t* repeatKernel, int32_t* goToStep5, int32_t* colOfStarAtRow, int32_t* colOfPrimeAtRow) {
    volatile int32_t* coveredCols1 = coveredCols;
    volatile int32_t* coveredRows1 = coveredRows;

    __shared__ int32_t zeroFound, goToStep5_shared;
    int32_t kernelRepeat = 0;

    int32_t thread = threadIdx.x;
    int32_t block = blockIdx.x;
    int32_t blockSize = blockDim.x;
    int32_t numberOfZeros = zeroesSizes[block];
    int32_t numberOfZeroesForThisThread = numberOfZeros / blockSize;
    int32_t numberOfZerosUnderMultiple = numberOfZeros % blockSize;
    int32_t startingIndex = 0;
    if (thread < numberOfZerosUnderMultiple) {
        numberOfZeroesForThisThread++;
        startingIndex = thread * numberOfZeroesForThisThread;
    } else {
        startingIndex = numberOfZerosUnderMultiple * (numberOfZeroesForThisThread + 1) + (thread - numberOfZerosUnderMultiple) * numberOfZeroesForThisThread;
    }

    int32_t zero = -1, zeroRow = -1, zeroCol = -1, starCol = -1;

    if (thread == 0) {
        goToStep5_shared = 0;
    }

    do {
        __syncthreads();
        if (thread == 0) zeroFound = 0;
        __syncthreads();

        for (int32_t i = 0; i < numberOfZeroesForThisThread && startingIndex + i < numberOfZeros; ++i) {
            zero = zeroes[block * numberOfDataPerBlock + startingIndex + i];
            zeroRow = zero % workers;
            zeroCol = zero / workers;
            starCol = colOfStarAtRow[zeroRow];
            if (coveredCols1[zeroCol] == 0 && coveredRows1[zeroRow] == 0) {
                colOfPrimeAtRow[zeroRow] = zeroCol;
                zeroFound = 1;
                kernelRepeat = 1;
                if (starCol != -1) {
                    coveredRows1[zeroRow] = 1;
                    __threadfence();
                    coveredCols1[starCol] = 0;
                } else {
                    goToStep5_shared = 1;
                }
            }
        }
        __syncthreads();
    } while(zeroFound == 1 && goToStep5_shared == 0);

    if (thread == 0) {
        if (goToStep5_shared) *goToStep5 = 1;
    }
    if (kernelRepeat) *repeatKernel = 1;
}
