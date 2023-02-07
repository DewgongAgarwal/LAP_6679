#include <stdlib.h>
#include <cuda.h>
#include <stdbool.h>

// Step 2
__global__
void initialMatching(bool* coveredRows, bool* coveredCols, int32_t* rowOfStarAtColumn, int32_t* colOfStarAtRow, int32_t* zeroes, int32_t numCols) {
    int32_t thread = threadIdx.x;
    int32_t block = blockIdx.x;
    int32_t flag = 0, pos, r, c;

    while (flag != 1) {
        for(int32_t i = 0; i < numberOfZerosInBlock[block]; i++) {
            pos = zeros[i * blockDim.x + thread]
            r = pos % numCols;
            c = pos / numCols;
            flag = 1;
            if (coveredRows[r] && coveredCols[c])
                if (!atomicExch(&coveredRows[r], true))
                    if (!atomicExch(&coveredCols[c], true)) {
                        rowOfStarAtColumn[r] = c;
                        colOfStarAtRow[c] = r;
                    } else {
                        coveredRows[r] = false;
                        flag = 0;
                    }
        }
    }
    __syncthreads()
}
