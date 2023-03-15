#include <cuda.h>
#include <stdint.h>

__global__ void frontierInit(int32_t* frontier, int32_t* newFrontier, 
    int32_t* visited, int32_t* reverse, int32_t* Ar, int32_t workers,
    int32_t* lengthOfFrontier) {
    
    int32_t i = blockIdx.x * blockDim.x + threadIdx.x;
    if(i < workers && Ar[i] == -1) {
        int32_t current = atomicAdd(lengthOfFrontier, 1);
        frontier[current] = i;
    }
}

__global__ void visitedInit(int32_t* visited, int32_t* frontier, int32_t workers, int32_t* lengthOfFrontier) {
    int32_t i = blockIdx.x * blockDim.x + threadIdx.x;
    if(i < *lengthOfFrontier) {
        visited[frontier[i]] = 1;
    }
}

__global__ void forward(int32_t* frontier, int32_t* costs, double* Dr, double* Dc, 
                        int32_t* Ac, int32_t* Vr, int32_t* Vc, double* slack, 
                        int32_t* Pr, int32_t* Pc, int32_t workers, int32_t* newFrontier, 
                        int32_t* reverse, int32_t* countReverse, 
                        int32_t* visited, int32_t* lengthOfFrontier, int32_t* lengthOfNewFrontier) {
    
    int32_t j = blockIdx.x * blockDim.x + threadIdx.x;
    double eps = 1e-6;
    if (j < workers && Vc[j] == 0) {
        int32_t inew = Ac[j];
        double DcCopy = Dc[j];
        double slacksCopy = slack[j];
        bool inReverse = false, inNewFrontier = false;
        for(int32_t i1 = 0; i1 < *lengthOfFrontier; i1++) {
            int32_t i = frontier[i1];
            double DrCopy = Dr[i];
            int32_t costsCopy = costs[j * workers + i];
            if (slacksCopy > costsCopy - DrCopy - DcCopy) {
                slacksCopy = costsCopy - DrCopy - DcCopy;
                Pc[j] = i;
            }
            if (slacksCopy < eps && slacksCopy > -eps) {
                inNewFrontier = (inew != -1);
                inReverse = (inew == -1);
            }
        }
        if (inNewFrontier) {
            Pr[inew] = j;
            Vr[inew] = 0;
            Vc[j] = 1;
            if (!visited[inew]) {
                int32_t offset = atomicAdd(lengthOfNewFrontier, 1);
                newFrontier[offset] = inew;
            }
        }
        if (inReverse) {
            *countReverse = 1;
            reverse[j] = 1;
        }
        slack[j] = slacksCopy;
    }
}