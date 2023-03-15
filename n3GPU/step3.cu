#include <cuda.h>
#include <stdbool.h>
#include "forwardPassKernel.cu"

__host__ void step3(int32_t* frontier, int32_t* costs, double* Dr, double* Dc, 
    int32_t* Ar, int32_t* Ac, int32_t* Vr, int32_t* Vc, double* slack, 
    int32_t* Pr, int32_t* Pc, int32_t workers, int32_t* newFrontier, int32_t* repeat,
    int32_t* reverse, int32_t* countNewFrontier, int32_t* countReverse, 
    int32_t* visited, int32_t* goStep4, int32_t blocks, int32_t threads,
    int32_t requiresInitialization, int32_t* lengthOfFrontier, int32_t* lengthOfNewFrontier) {

    cudaMemset(lengthOfNewFrontier, 0, sizeof(int32_t));
    if (requiresInitialization)
        cudaMemset(lengthOfFrontier, 0, sizeof(int32_t));
        cudaMemset(visited, 0, workers * sizeof(int32_t));
        cudaMemset(reverse, 0, workers * sizeof(int32_t));
        frontierInit<<<blocks, threads>>>(frontier, newFrontier, visited, 
            reverse, Ar, workers, lengthOfFrontier);

    *repeat = 0;
    int32_t count = 0;
    do {
        if (count == 0) {
            cudaMemset(lengthOfNewFrontier, 0, sizeof(int32_t));
            forward<<<blocks, threads>>>(frontier, costs, Dr, Dc, Ac, 
                Vr, Vc, slack, Pr, Pc, workers, newFrontier, reverse, 
                countReverse, visited, lengthOfFrontier, 
                lengthOfNewFrontier);
            cudaMemcpy(repeat, lengthOfNewFrontier, sizeof(int32_t), cudaMemcpyDeviceToHost);
            visitedInit<<<blocks, threads>>>(visited, frontier, workers, lengthOfFrontier);
            count = 1;
        } else {
            cudaMemset(lengthOfFrontier, 0, sizeof(int32_t));
            forward<<<blocks, threads>>>(newFrontier, costs, Dr, Dc, Ac, 
                Vr, Vc, slack, Pr, Pc, workers, frontier, reverse, 
                countReverse, visited, lengthOfNewFrontier, 
                lengthOfFrontier);
            cudaMemcpy(repeat, lengthOfFrontier, sizeof(int32_t), cudaMemcpyDeviceToHost);
            visitedInit<<<blocks, threads>>>(visited, newFrontier, workers, lengthOfNewFrontier);
            count = 0;
        }
        
    } while(*repeat > 0);
    cudaMemcpy(goStep4, countReverse, sizeof(int32_t), cudaMemcpyDeviceToHost);
    cudaMemset(countReverse, 0, sizeof(int32_t));

}