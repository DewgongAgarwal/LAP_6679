#include <cuda.h>
#include <stdint.h>
#include <limits.h>

__global__ void transpose(int32_t* rows, int32_t* cols, int32_t workers) {
    int32_t i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i < workers * workers) {
        cols[i] = rows[(i % workers) * workers + i / workers];
    }
}

__global__ void findRowMin(int32_t* rowData, int32_t* storage, int32_t* other, int32_t size) {
    int32_t minimum = INT_MAX;
    int32_t rowCopy;
    int32_t rowIndex = blockIdx.x * blockDim.x + threadIdx.x;
    for(int32_t i = 0; i < size; i++) {
        if (rowIndex * size + i >= size * size) {
            break;
        }
        rowCopy = rowData[i + rowIndex * size] - other[i];
        minimum = minimum ^ ((rowCopy ^ minimum) & -(rowCopy < minimum));
    }
    if (rowIndex < size) {
        storage[rowIndex] = minimum;
    }
}

__global__ void subtractFromRow(int32_t* slacks, int32_t* rowMins, int32_t size) {
    int32_t i = blockIdx.x * blockDim.x + threadIdx.x;
    int32_t row = i % size;
    if (i < size * size) {
        slacks[i] = slacks[i] - rowMins[row];
    }
}

__global__ void subtractFromCol(int32_t* slacks, int32_t* colMins, int32_t size) {
    int32_t i = blockIdx.x * blockDim.x + threadIdx.x;
    int32_t col = i / size;
    if (i < size * size) {
        slacks[i] = slacks[i] - colMins[col];
    }
}
