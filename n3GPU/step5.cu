#include <cuda.h>
#include "augmentKernel.cu"

__host__ void step5(int32_t* aug, int32_t* Sr, int32_t* Sc, int32_t* Ar, 
    int32_t* Ac, int32_t workers, int32_t blocks, int32_t threads) {

    augmentKernel<<<blocks, threads>>>(aug, Sr, Sc, Ar, Ac, workers);

}