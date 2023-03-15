#include <stdint.h>
#include <cuda.h>
#include <limits.h>

__global__ void minKernel(double* min, double* newMin, int32_t size) {
    __shared__ double partial[512];
    int32_t index = threadIdx.x;
    int32_t i = blockIdx.x * blockDim.x + threadIdx.x;
    double x = 0;
    double y = 0;
    if (i < size) {
        int32_t temp = min[i];
        if (temp > 0) {
            partial[threadIdx.x] = temp; 
        } else {
            partial[threadIdx.x] = (double)INT_MAX;
        }
    } else {
        partial[threadIdx.x] = (double)INT_MAX;
    }
    for(int32_t stride = blockDim.x / 2; stride >= 1; stride /= 2) {
        __syncthreads();

        if (index < stride) {
            x = partial[index];
            y = partial[index + stride];
            partial[index] = fmin(x, y);
        }
    }
    if(index == 0) {
        newMin[blockIdx.x] = partial[index];
    }
}

__global__ void dualUpdate(double theta, int32_t* Vr, int32_t* Vc, int32_t* Pc,
    double* Dr, double* Dc, double* slack, int32_t size, int32_t* frontier, 
    int32_t* countNewFrontier, int32_t* lengthOfFrontier) {
    
    int32_t k = blockIdx.x * blockDim.x + threadIdx.x;
    if (k  < size) {

        Dc[k] = fma(0.5 - Vc[k], theta, Dc[k]);
        Dr[k] = fma(0.5 - Vr[k], theta, Dr[k]);
        double slacksCopy = slack[k];
        if (slacksCopy > 0.0) {
            slacksCopy = fma(-1.0, theta, slacksCopy);
            if (slacksCopy == 0.0) {
                *countNewFrontier = 1;
                int32_t current = atomicAdd(lengthOfFrontier, 1);
                frontier[current] = Pc[k];
            }
            slack[k] = slacksCopy;
        }
    }
}
