#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <limits.h>
#include "types.h"
#include <time.h>

void printArray(int32_t* a, int32_t size) {
    for(int32_t i = 0; i < size; i++) {
        printf("%d, ", a[i]);
    }
    printf("\n");
}


void initialReduction(int32_t** costs, double* Dr, double* Dc, int32_t workers) {
    for(int32_t i = 0; i < workers; i++) {
        Dr[i] = INT_MAX;
        Dc[i] = INT_MAX;
    }
    for(int32_t i = 0; i < workers; i++) {
        for(int32_t j = 0; j < workers; j++) {
            if (costs[i][j] < Dr[i]) {
                Dr[i] = costs[i][j];
            }
        }
    }
    for(int32_t i = 0; i < workers; i++) {
        for(int32_t j = 0; j < workers; j++) {
            if (costs[i][j] - Dr[i] < Dc[j]) {
                Dc[j] = costs[i][j] - Dr[i];
            }
        }
    }
}


void resetToSentinels(int32_t* Vr, int32_t* Vc, int32_t* Pr, int32_t* Pc, int32_t workers) {
    for(int32_t i = 0; i < workers; i++) {
        Vr[i] = 0;
        Vc[i] = 0;
        Pr[i] = -1;
        Pc[i] = -1;
    }
}

void optimalityCheck(int32_t* Vr, int32_t* Vc, int32_t* Pr, int32_t* Pc, int32_t workers, int32_t* matchCount, int32_t* Ar, int32_t* Ac) {
    *matchCount = 0; 
    resetToSentinels(Vr, Vc, Pr, Pc, workers);
    for(int32_t i = 0; i < workers; i++) {
        if (Ar[i] != -1) {
            *matchCount += 1;
            Vr[i] = 1;
        }
    }
}

void initSlack(double* slack, int32_t workers) {
    for(int32_t i = 0; i < workers; i++) {
        slack[i] = INT_MAX;
    }
}

void update2(int32_t* Vr, int32_t* Vc, double* slack, int32_t* Pc, int32_t workers, Node** head, double* Dr, double* Dc, int32_t* stackLength) {
    int32_t theta = INT_MAX;
    for(int32_t i = 0; i < workers; i++) {
        if (slack[i] < theta && slack[i] > 0) {
            theta = slack[i];
        }
    }
    for(int32_t i = 0; i < workers; i++) {
        if (Vr[i] == 0) {
            Dr[i] += theta/2.0;
        } else {
            Dr[i] -= theta/2.0;
        }
        if (Vc[i] == 0) {
            Dc[i] += theta/2.0;
        } else {
            Dc[i] -= theta/2.0;
        }
    }
    
    for(int32_t i = 0; i < workers; i++) {
        if (slack[i] > 0) {
            slack[i] -= theta;
            if (slack[i] == 0) {
                if (*stackLength == 0) {
                    *head = pushFirst(Pc[i]);
                    *stackLength = 1;
                } else {
                    push(head, Pc[i]);
                    *stackLength += 1;
                }
            }
        }
    }
}

int32_t costsCalc(int32_t** costs, int32_t* Ar, int32_t workers) {
    int32_t totalCost = 0;
    for(int32_t i = 0; i < workers; i++) {
        totalCost += costs[i][Ar[i]];
    }
    printf("Cost = %d\n", totalCost);
    printf("\nAssignments:\n");
    printArray(Ar, workers);
    return totalCost;
}

void augment(int32_t j, int32_t* Ar, int32_t* Ac, int32_t* Pr, int32_t* Pc) {
    int32_t ccur = j;
    int32_t rcur = -1;
    while (ccur != -1) {
        rcur = Pc[ccur];
        Ar[rcur] = ccur;
        Ac[ccur] = rcur;
        ccur = Pr[rcur];
    }
}

bool search(int32_t** costs, double* Dr, double* Dc, int32_t* Vr, int32_t* Vc, int32_t* Pr, int32_t* Pc, double* slack, int32_t* Ar, int32_t* Ac, int32_t workers, int32_t* matchCount, Node** head, int32_t* stackLength) {
    int32_t inew = 0;
    while (*stackLength > 0) {
        int32_t i = pop(head);
        *stackLength -= 1;
        for (int32_t j = 0; j < workers; j++)
        {   
            if (slack[j] > costs[i][j] - Dr[i] - Dc[j]) {
                slack[j] = costs[i][j] - Dr[i] - Dc[j];
                Pc[j] = i;
            }
        
            if (costs[i][j] - Dr[i] - Dc[j] == 0) {
                inew = Ac[j];
                if (Vc[j] == 0) {
                    if (inew == -1) {
                        augment(j, Ar, Ac, Pr, Pc);
                        optimalityCheck(Vr, Vc, Pr, Pc, workers, matchCount, Ar, Ac);
                        return true;
                    } else {
                        Vc[j] = 1;
                        Vr[inew] = 0;
                        if (*stackLength == 0) {
                            *head = pushFirst(inew);
                            *stackLength = 1;
                        } else {
                            push(head, inew);
                            *stackLength += 1;
                        } 
                        Pr[inew] = j;
                    }
                }
            }
        }       
    }
    return false;
}

void n3hungarian(int32_t workers, int32_t** costs) {
    double* Dr = calloc(workers, sizeof(double));
    double* Dc = calloc(workers, sizeof(double));
    int32_t* Vr = calloc(workers, sizeof(int32_t));
    int32_t* Vc = calloc(workers, sizeof(int32_t));
    int32_t* Pr = calloc(workers, sizeof(int32_t));
    int32_t* Pc = calloc(workers, sizeof(int32_t));
    int32_t* Ar = calloc(workers, sizeof(int32_t));
    int32_t* Ac = calloc(workers, sizeof(int32_t));
    double* slack = calloc(workers, sizeof(double));
    int32_t* matchCount = calloc(1, sizeof(int32_t));
    bool exit = false;
    initialReduction(costs, Dr, Dc, workers);
    for(int32_t i = 0; i < workers; i++) {
        Ar[i] = -1;
        Ac[i] = -1;
    }
    int32_t* stackLength = calloc(1, sizeof(int32_t));
    while(true) {
        optimalityCheck(Vr, Vc, Pr, Pc, workers, matchCount, Ar, Ac);
        if (*matchCount == workers) {
            costsCalc(costs, Ar, workers);
            return;
        }
        initSlack(slack, workers);
        Node* head = 0;
        *stackLength = 0;
        for(int32_t i = 0; i < workers; i++) {
            if (Vr[i] == 0) {
                if (*stackLength == 0) {
                    head = pushFirst(i);
                    *stackLength = 1;
                } else {
                    push(&head, i);
                    *stackLength += 1;
                }
            }
        }
        do {
            exit = search(costs, Dr, Dc, Vr, Vc, Pr, Pc, slack, Ar, Ac, workers, matchCount, &head, stackLength);
            if (exit) {
                break;
            } else {
                head = 0;
                *stackLength = 0;
            }
            update2(Vr, Vc, slack, Pc, workers, &head, Dr, Dc, stackLength);
        } while(!exit);
    }
    free(Dr);
    free(Dc);
    free(Vr);
    free(Vc);
    free(Pr);
    free(Pc);
    free(Ar);
    free(Ac);
    free(slack);
    free(matchCount);
}

void generateCosts(int32_t** costs, int32_t workers) {
    for(int32_t i = 0; i < workers; i++) {
        for(int32_t j = 0; j < workers; j++) {
            costs[i][j] = rand() % workers;
        }
    }
}

int main() {
    double* time = calloc(11, sizeof(double));
    double start = 0;
    double end = 0;
    double cpu_time_used = 0;
    for (int32_t j = 2; j < 13; j++) {
        printf("Workers: %d\n", 1 << j);
        int32_t workers = 1 << j;
        int32_t array[25] = {9, 22, 58, 11, 19, 43, 78, 72, 50, 63, 41, 28, 91, 37, 45, 74, 42, 27, 49, 39, 36, 11, 57, 22, 25};
        int32_t** costs = calloc(workers, sizeof(int32_t*));
        for(int32_t i = 0; i < workers; i++) {
            costs[i] = calloc(workers, sizeof(int32_t));
            // for (int32_t j = 0; j < workers; j++) {
            //     costs[i][j] = array[i * workers + j];
            // }
        }
        generateCosts(costs, workers);
        start = clock();
        n3hungarian(workers, costs);
        end = clock();
        cpu_time_used = ((double) (end - start)) / CLOCKS_PER_SEC;
        time[j - 2] = cpu_time_used;
        for(int32_t i = 0; i < workers; i++) {
            free(costs[i]);
        }
        free(costs);
    }
    for (int32_t i = 0; i < 11; i++) {
        printf("%f\n", time[i]);
    }
    return 0;
}