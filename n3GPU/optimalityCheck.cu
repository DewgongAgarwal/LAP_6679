#include <cuda.h>
#include <stdint.h>
#include <limits.h>

__global__ void optimal(int32_t* Ar, int32_t* Vr, int32_t* countsSum, int32_t size, int32_t* Pc, int32_t* Sr, int32_t* Pr, int32_t* Sc, int32_t* Vc, double* slacks) {
    int32_t i = blockIdx.x * blockDim.x + threadIdx.x;

    if (i < size) {
        Pc[i] = -1;
        Sr[i] = -1;
        Pr[i] = -1;
        Sc[i] = -1;
        Vr[i] = 0;
        Vc[i] = 0;
        slacks[i] = (double) INT_MAX;
        if (Ar[i] != -1) {
            Vr[i] = 1;
            atomicAdd(countsSum, 1);
        }
    }
}