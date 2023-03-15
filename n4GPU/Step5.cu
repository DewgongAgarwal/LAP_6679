#include <stdlib.h>
#include <cuda.h>
#include <stdbool.h>

__global__ void removeOverlappingPaths(int32_t* colOfPrimeAtRow, int32_t* colOfStarAtRow, int32_t* rowOfStarAtCol, int32_t* rowOfGreenAtCol, int32_t size) {
    int32_t i = blockDim.x * blockIdx.x + threadIdx.x;
    if (i < size) {
        int32_t colOfPrime = colOfPrimeAtRow[i];
        int32_t row = 0;
        if (colOfPrime != -1 && colOfStarAtRow[i] == -1) {
            rowOfGreenAtCol[colOfPrime] = i;
            row = rowOfStarAtCol[colOfPrime];
            while (row != -1) {
                colOfPrime = colOfPrimeAtRow[row];
                rowOfGreenAtCol[colOfPrime] = row;
                row = rowOfStarAtCol[colOfPrime];
            }
        }
    }
}

__global__ void alternatingPaths(int32_t* colOfStarAtRow, int32_t* rowOfStarAtCol, int32_t* rowOfGreenAtCol, int32_t size) {
    int32_t i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i < size) {
        int32_t rowZ0 = rowOfGreenAtCol[i];
        int32_t colZ2, colZ0;
        if(rowZ0 != -1 && rowOfStarAtCol[i] == -1) {
            colZ2 = colOfStarAtRow[rowZ0];
            colOfStarAtRow[rowZ0] = i;
            rowOfStarAtCol[i] = rowZ0;
            while(colZ2 != -1) {
                rowZ0 = rowOfGreenAtCol[colZ2];
                colZ0 = colZ2;
                colZ2 = colOfStarAtRow[rowZ0];
                colOfStarAtRow[rowZ0] = colZ0;
                rowOfStarAtCol[colZ0] = rowZ0;
            }
        }
    }
}