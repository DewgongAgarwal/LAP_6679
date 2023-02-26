#include <cuda.h>
#include <stdint.h>

__global__ void forward(int32_t* frontier, int32_t* costs, double* Dr, double* Dc, int32_t* Ac, int32_t* Vr, int32_t* Vc, double* slack, int32_t* Pr, int32_t* Pc, int32_t workers, int32_t* newFrontier, int32_t* reverse, int32_t* countNewFrontier, int32_t* countReverse, int32_t* visited) {
    int32_t j = blockIdx.x * blockDim.x + threadIdx.x;
    
    if (j < workers) {
        int32_t inew = Ac[j];
        int32_t cost = 0;
        double slacks = slack[j];
        double DcCopy = Dc[j];
        double DrCopy = 0;
        int32_t vcCopy = Vc[j];
        int32_t inFrontier = 0;
        int32_t inReverse = 0;
        for(int32_t i = 0;  (vcCopy == 0) && (i < workers); i++) {
            if (frontier[i] == 0 || visited[i] == 1) {
                continue;
            }
            DrCopy = Dr[i];
            cost = costs[j * workers + i];
            Pc[j] = (slacks > cost - DrCopy - DcCopy) * i + (slacks <= cost - DrCopy - DcCopy) * Pc[j];
            slacks = (slacks > cost - DrCopy - DcCopy) * (cost - DrCopy - DcCopy) + (slacks <= cost - DrCopy - DcCopy) * slacks;
            inFrontier = inFrontier || (slacks <= 0.0001 && inew != - 1);
            inReverse = inReverse || (slacks <= 0.0001 && inew == - 1);
        }
        slack[j] = slacks;
        if(inFrontier) {
            *countNewFrontier = 1;
            Pr[inew] = j;
            Vc[j] = 1;
            Vr[inew] = 0;
            newFrontier[inew] = 1;
        }
        if(inReverse) {
            *countReverse = 1;
            reverse[j] = 1;
        }
    }
}

__global__ void reverseKernel(int32_t* reverse, int32_t* Pr, int32_t* Pc, int32_t* Sr, int32_t* Sc, int32_t* augment, int32_t size) {
    int32_t j = blockIdx.x * blockDim.x + threadIdx.x;
    if (j < size && reverse[j] == 1) {
        int32_t rcur = - 1;
        int32_t ccur = j;
        while (ccur != -1) {
            Sc[ccur] = rcur;
            rcur = Pc[ccur];
            Sr[rcur] = ccur;
            ccur = Pr[rcur];
        }
        augment[rcur] = 1;
    }
}
