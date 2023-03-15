#include <cuda.h>
#include "dualUpdate.cu"

__host__ void getMinSlack(double* slack, double* newSlack, double* newSlack2, 
    int32_t workers, double* minSlack) {
    
    int32_t threads = 512;
    int32_t blocks = (workers + threads - 1) / threads;
    int32_t flag = -1;
    int32_t lengthOfCountSum = workers;
    minKernel<<<blocks, threads>>>(slack, newSlack, lengthOfCountSum);
    lengthOfCountSum = blocks;
    while(lengthOfCountSum > 1) {
        blocks = (lengthOfCountSum + threads - 1) / threads;
        minKernel<<<blocks, threads>>>(newSlack, newSlack2, lengthOfCountSum);
        lengthOfCountSum /= threads;
        flag = 0;
        if (lengthOfCountSum > 1) {
            blocks = (lengthOfCountSum + threads - 1) / threads;
            minKernel<<<blocks, threads>>>(newSlack2, newSlack, lengthOfCountSum);
            lengthOfCountSum /= threads;
            flag = 1;
        }
    }
    if (flag * flag == 1) {
        cudaMemcpy(minSlack, newSlack, sizeof(double), cudaMemcpyDeviceToHost);
    } else {
        cudaMemcpy(minSlack, newSlack2, sizeof(double), cudaMemcpyDeviceToHost);
    }

}

__host__ void step6(double* slack, double* newSlack, double* newSlack2, 
    int32_t workers, int32_t* Vr, int32_t* Vc, int32_t* Pc, double* Dr, 
    double* Dc, int32_t* frontier, int32_t* countNewFrontier, int32_t blocks, 
    int32_t threads, int32_t* lengthOfFrontier) {

    double* theta = (double*)calloc(1, sizeof(double));
    getMinSlack(slack, newSlack, newSlack2, workers, theta);
    cudaMemset(lengthOfFrontier, 0, sizeof(int32_t));
    dualUpdate<<<blocks, threads>>>(*theta, Vr, Vc, Pc, Dr, Dc, slack, workers, 
        frontier, countNewFrontier, lengthOfFrontier);
    free(theta);

}