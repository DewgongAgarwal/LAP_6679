#include <stdlib.h>
#include <stdbool.h>
#include <cuda.h>
#include <cuda_runtime.h>
#include "optimalityCheck.cu"

__host__ bool step2(int32_t *Ar, int32_t *Vr, int32_t *countsSum, int32_t workers, 
                    int32_t *Pc, int32_t *Sr, int32_t *Pr, int32_t *Sc, int32_t *Vc, 
                    double *slacks, int32_t *matchCount, int32_t blocks, int32_t threads){
    

    cudaMemset(countsSum, 0, sizeof(int32_t));
    optimal<<<blocks, threads>>>(Ar, Vr, countsSum, workers, Pc, Sr, Pr, Sc, Vc, slacks);
    cudaMemcpy(matchCount, countsSum, sizeof(int32_t), cudaMemcpyDeviceToHost);
    return (*matchCount == workers);
    
}