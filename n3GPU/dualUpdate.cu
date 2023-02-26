#include <stdint.h>
#include <cuda.h>
#include <limits.h>

__global__ void minKernel(double* min, double* newMin, int32_t size) {
    __shared__ double partial[32];
    int32_t index = threadIdx.x;
    int32_t i = blockIdx.x * blockDim.x + threadIdx.x;
    double x = 0;
    double y = 0;
    if (i < size) {
        int32_t temp = min[i];
        partial[threadIdx.x] = (temp > -0.0001) * temp + (1 - temp > -0.0001) * INT_MAX; 
    } else {
        int32_t temp = min[0];
        partial[threadIdx.x] = (temp > -0.0001) * temp + (1 - temp > -0.0001) * INT_MAX;
    }
    for(int32_t stride = blockDim.x / 2; stride >= 1; stride /= 2) {
        __syncthreads();

        if (index < stride) {
            x = partial[index];
            y = partial[index + stride];
            partial[index] = (x < y) * x + (1 - x < y) * y;
        }
    }
    if(index == 0) {
        newMin[blockIdx.x] = partial[index];
    }
}

__global__ void dualUpdate(double theta, int32_t* Vr, int32_t* Vc, int32_t* Pc, double* Dr, double* Dc, double* slack, int32_t size, int32_t* frontier, int32_t* countNewFrontier) {
    int32_t k = blockIdx.x * blockDim.x + threadIdx.x;
    if (k  < size) {
        double Dr1 = Dr[k];
        double Dc1 = Dc[k];
        double slacks = slack[k];
        double tempSlack = slacks;
        Dr1 += (-2 * Vr[k] + 1) * theta / 2.0;
        Dc1 += (-2 * Vc[k] + 1) * theta / 2.0;

        slacks -= (slacks > 0) * theta;
        frontier[Pc[k]] = frontier[Pc[k]] || (tempSlack > 0 && slacks <= 0.0001);
        *countNewFrontier = *countNewFrontier || (tempSlack > 0 && slacks <= 0.0001);

        Dr[k] = Dr1;
        Dc[k] = Dc1;
        slack[k] = slacks;
    }
}
