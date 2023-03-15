#include <cuda.h>
#include <stdint.h>
#include <limits.h>

__global__ void transpose(int32_t* row, int32_t* col, int32_t size) {
    int32_t i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i < size * size) {
        col[(i % size) * size + (i / size)] = row[i];
    }
}

__global__ void findRowMin(int32_t* rowData, double* storage, double* other, int32_t size) {
    int32_t minimum = INT_MAX;
    int32_t rowCopy;
    int32_t rowIndex = blockIdx.x * blockDim.x + threadIdx.x;
    if (rowIndex < size) {
        for(int32_t i = 0; i < size; i++) {
            rowCopy = rowData[i + rowIndex * size] - other[i];
            minimum = minimum ^ ((rowCopy ^ minimum) & -(rowCopy < minimum));
        }
    }
    if (rowIndex < size) {
        storage[rowIndex] = minimum;
    }
}
