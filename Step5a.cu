#include <stdlib.h>
#include <cuda.h>
#include <stdbool.h>

// Step 5a
__global__
void removeOverlappingPaths(int32_t* colOfPrimeAtRow, int32_t* colOfStarAtRow, int32_t* rowOfStarAtCol, int32_t* rowOfGreenAtCol) {
    int32_t = threadIdx.x + blockIdx.x * blockDim.x;
    int32_t col = colOfPrimeAtRow[i];
    int32_t starCol = colOfStarAtRow[i];
    int32_t row = -1;
    if (col != -1 && starCol != -1) {
        rowOfGreenAtCol[col] = i;
        while(rowOfStarAtCol[col] != -1) {
            row = rowOfStarAtCol[col];
            col = colOfPrimeAtRow[col];
            rowOfGreenAtCol[col] = row;
        }
    }
}
