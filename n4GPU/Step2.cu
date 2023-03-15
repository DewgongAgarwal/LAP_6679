#include <stdlib.h>
#include <cuda.h>
#include <stdbool.h>
#include <math.h>

__global__ void initialMatching(int32_t *rowOfStarAtCol, int32_t *colOfStarAtRow, int32_t *coveredRows, int32_t *coveredCols, int32_t *zeroes, int32_t *zeroesSizes, int32_t* repeatKernel, int32_t numberOfDataPerBlock, int32_t workers) {

    __shared__ int32_t repeat, kernelRepeat;
    int32_t thread = threadIdx.x;
    int32_t block = blockIdx.x;
    int32_t blockSize = blockDim.x;

    if (thread == 0) {
        kernelRepeat = 0;
    }

    int32_t numberOfZeros = zeroesSizes[block];

    int32_t zero = -1, zeroRow = -1, zeroCol = -1;

    
    do {
        __syncthreads();
        if (thread == 0) repeat = 0;
        __syncthreads();
        for (int32_t i = thread; i < numberOfZeros; i += blockSize) {
            zero = zeroes[block * numberOfDataPerBlock + i];
            zeroRow = zero % workers;
            zeroCol = zero / workers;
            if(coveredRows[zeroRow] == 0 && coveredCols[zeroCol] == 0) {
                if (!atomicExch((int *)(&coveredRows[zeroRow]),1)) {
                    if(!atomicExch((int*)(&coveredCols[zeroCol]),1)) {
                        rowOfStarAtCol[zeroCol] = zeroRow;
                        colOfStarAtRow[zeroRow] = zeroCol;
                    } else {
                        coveredRows[zeroRow] = 0;
                        repeat = 1;
                        kernelRepeat = 1;
                    }
                }       
            }
        }
        __syncthreads();
    } while (repeat);

    if (kernelRepeat != 0) {
        *repeatKernel = kernelRepeat;
    } else {
        *repeatKernel = 0;
    }
}