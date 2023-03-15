#include <cuda.h>
#include <cuda_runtime.h>
#include "rowReduction.cu"

__host__ void step1(int32_t* costsRowwise_d, int32_t* costsColwise_d, int32_t *costsRowwise_h, 
                    double *Dr, double *Dc, int32_t workers, 
                    int32_t blocks, int32_t threads) {

    cudaMemcpy(costsRowwise_d, costsRowwise_h, sizeof(int32_t) * workers * workers, cudaMemcpyHostToDevice);
    transpose<<<(workers * workers + threads - 1) / threads, threads>>>(costsRowwise_d, costsColwise_d, workers);
    findRowMin<<<blocks, threads>>>(costsRowwise_d, Dr, Dc, workers);
    findRowMin<<<blocks, threads>>>(costsColwise_d, Dc, Dr, workers);

}    
    