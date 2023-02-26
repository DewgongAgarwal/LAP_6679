#include <cuda.h>
#include <stdint.h>
#include <limits.h>

__global__ void findRowMin(int32_t* rowData, double* storage, double* other, int32_t size) {
    int32_t minimum = INT_MAX;
    int32_t rowCopy;
    int32_t rowIndex = blockIdx.x * blockDim.x + threadIdx.x;
    for(int32_t i = 0; i < size; i++) {
        if (rowIndex * size + i >= size * size) {
            break;
        }
        rowCopy = rowData[i + rowIndex * size] - other[i];
        minimum = (rowCopy < minimum) * rowCopy + (1 - (rowCopy < minimum)) * minimum;
    }
    if (rowIndex < size) {
        storage[rowIndex] = minimum;
    }
}
