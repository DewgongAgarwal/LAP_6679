#include <cuda.h>
#include "reversePassKernel.cu"

__host__ void step4(int32_t* reverse, int32_t* Pr, int32_t* Pc, int32_t* Sr, int32_t* Sc, 
    int32_t* augment, int32_t workers, int32_t blocks, int32_t threads) {
    // augmentInit<<<blocks, threads>>>(augment, workers);
    cudaMemset(augment, 0, workers * sizeof(int32_t));
    reverseKernel<<<blocks, threads>>>(reverse, Pr, Pc, Sr, Sc, augment, workers);

}