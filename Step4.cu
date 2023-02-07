#include <stdlib.h>
#include <cuda.h>
#include <stdbool.h>

//Step 4

void alternatingGraphPathSearch(bool* coveredRows, bool* coveredCols, int32_t* colOfPrimeAtRow, int32_t* rowOfStarAtColumn) {
    volatile bool* copyCoveredRows = coveredRows;
    volatile bool* copyCoveredCols = coveredCols;

    bool zeroFound = false, goToStep5 = false, repeatKernel = false;

    do {
        __syncthreads();
        zeroFound = false;
        __syncthreads();

        for(int32_t i = 0; i < numberOfZerosInBlock[block]; i++) {
            pos = zeros[i * blockDim.x + thread]
            r = pos % numCols;
            c = pos / numCols;
            if (!copyCoveredCols[c] && !copyCoveredRows[r]) {
                colOfPrimeAtRow[r] = c;
                repeatKernel = true;
                if (rowOfStarAtColumn[c] != -1) {
                    copyCoveredRows[r] = true;
                    __threadfence();
                    copyCoveredCols[c] = false;
                } else {
                    goToStep5 = true;
                }
            }
        }
        __syncthreads();
        if (goToStep5) {
            break;
        }
    } while (zeroFound);
    __syncthreads();
}