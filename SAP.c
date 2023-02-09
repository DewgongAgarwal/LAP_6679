#include <stdlib.h>
#include <stdio.h>
#include <stdbool.h>
#include <limits.h>

void printArray(int32_t* a, int32_t size) {
    for(int32_t i = 0; i < size; i++) {
        printf("%d, ", a[i]);
    }
    printf("\n");
}
void printMatrix(int32_t** m, int32_t rows) {
    for(int32_t i = 0; i < rows; i++) {
        printArray(m[i], rows);
    }
}

void recalibrate(int32_t** costs, int32_t workers, int32_t* distance, int32_t* path) {
    int32_t total = 2 * workers + 2;
    int32_t recalibratedCost = 0;
    for(int32_t i = 1; i < workers + 1; i++) {
        for(int32_t j = workers + 1; j < total - 1; j++) {
            if (costs[i][j] == -1) {
                continue;
            }
            recalibratedCost = distance[i] - distance[j] + costs[i][j];
            if (recalibratedCost < 0) {
                recalibratedCost = 0;
            }
            costs[i][j] = recalibratedCost;
        }
    }
    for(int32_t i = workers + 1; i < total - 1; i++) {
        if (costs[i][total - 1] == -1) {
            continue;
        }
        recalibratedCost = distance[i] - distance[total - 1] + costs[i][total - 1];
        if (recalibratedCost < 0) {
            recalibratedCost = 0;
        }
        costs[i][total - 1] = recalibratedCost;
    }
    int32_t startIndex = total - 1;
    while(path[startIndex] != -1) {
        costs[path[startIndex]][startIndex] = -1;
        if (path[startIndex] != 0 && path[startIndex] != total - 1 && startIndex != total - 1)
            costs[startIndex][path[startIndex]] = 0;
        startIndex = path[startIndex];
    }
    return;
}

void djikstra(int32_t** costs, int32_t workers, int32_t source, int32_t* distance, int32_t* path) {
    int32_t total = 2 * workers + 2;
    bool visited[total];
    int32_t minDistanceVertex = -1, minDistance = INT_MAX;
    int32_t nextNode = 0, weight = 0, start = 0, end = 0;

    for(int32_t i = 0; i < total; i++) {
        path[i] = -1;
        visited[i] = false;
        distance[i] = INT_MAX;
    }

    distance[source] = 0;
    for(int32_t i = 0; i < total - 1; i++) {
        minDistance = INT_MAX;
        minDistanceVertex = -1;
        for(int32_t j = 0; j < total; j++) {
            if(!visited[j] && distance[j] <= minDistance) {
                minDistance = distance[j];
                minDistanceVertex = j;
            }
        }

        visited[minDistanceVertex] = true;

        if (minDistanceVertex == 0) {
            start = 1;
            end = workers + 1;
        } else if (minDistanceVertex == total - 1) {
            start = 0;
            end = 0;
        } else if (minDistanceVertex < workers + 1) {
            start = workers + 1;
            end = total - 1;
        } else {
            start = 1;
            end = workers + 1;
            weight = costs[minDistanceVertex][total - 1];
            if(weight != -1 && !visited[total - 1] && distance[minDistanceVertex] != INT_MAX && distance[minDistanceVertex] + weight < distance[total - 1]) {
                distance[total - 1] = distance[minDistanceVertex] + weight;
                path[total - 1] = minDistanceVertex;
            }
        }
        for(int32_t j = start; j < end; j++) {
            weight = costs[minDistanceVertex][j];
            if(weight != -1 && !visited[j] && distance[minDistanceVertex] != INT_MAX && distance[minDistanceVertex] + weight < distance[j]) {
                distance[j] = distance[minDistanceVertex] + weight;
                path[j] = minDistanceVertex;
            }
        }
    }
}

void costMatrix(int32_t** costs, int32_t** costsInput, int32_t nodes) {
    
    int32_t total = 2 * nodes + 2;
    costs[0][0] = -1;
    for(int32_t i = 1; i < nodes + 1; i++) {
        costs[0][i] = 0;
    } 
    for(int32_t i = nodes + 1; i < total; i++) {
        costs[0][i] = -1;
    } 

    for (int32_t i = 1; i < nodes + 1; i++) {
        for(int32_t j = 0; j < nodes; j++) { 
            costs[i][j + nodes + 1] = costsInput[i - 1][j];
        }
        costs[i][total - 1] = -1;
        for(int32_t j = 0; j < nodes + 1; j++) { 
            costs[i][j] = -1;
        }
    }

    for (int32_t i = nodes + 1; i < total - 1; i++) {
        for(int32_t j = 0; j < nodes + 1; j++) {
            costs[i][j] = -1;
        }
        for(int32_t j = nodes + 1; j < total - 1; j++) {
            costs[i][j] = -1;
        }
        costs[i][total - 1] = 0;
    } 
    for(int32_t i = 0; i < total; i++) {
        costs[total - 1][i] = -1;
    }  
}

void SAP(int32_t workers, int32_t** costsInput) {
    int32_t totalCost = 0;
    int32_t* assignment = calloc(workers, sizeof(int32_t));
    int32_t** costs = calloc(workers * 2 + 2, sizeof(int32_t*));
    int32_t* distance = calloc(workers * 2 + 2, sizeof(int32_t));
    int32_t* path = calloc(workers * 2 + 2, sizeof(int32_t));
    for(int32_t i = 0; i < 2 * workers + 2; i++) {
        costs[i] = calloc(workers * 2 + 2, sizeof(int32_t));
    }
    
    costMatrix(costs, costsInput, workers);
    for(int32_t i = 0; i < workers; i++) {
        djikstra(costs, workers, 0, distance, path);
        recalibrate(costs, workers, distance, path);
    }

    for(int32_t i = workers + 1; i < 2 * workers + 1; i++) {
        for(int32_t j = 1; j < workers + 1; j++) {
            if(costs[i][j] == 0) {
                totalCost += costsInput[j - 1][i - workers - 1];
                assignment[j - 1] = i - workers - 1;
                break;
            }
        }
    }
    printf("Cost = %d\n", totalCost);
    printf("\nAssignments:\n");
    printArray(assignment, workers);

    for(int32_t i = 0; i < 2 * workers + 2; i++) {
        free(costs[i]);
    }
    free(distance);
    free(path);
    free(costs);
    free(assignment);
}

int main() {
    int32_t workers = 5;
    int32_t array[25] = {9, 22, 58, 11, 19, 43, 78, 72, 50, 63, 41, 28, 91, 37, 45, 74, 42, 27, 49, 39, 36, 11, 57, 22, 25};
    int32_t** costs = calloc(workers, sizeof(int32_t*));
    for(int32_t i = 0; i < workers; i++) {
        costs[i] = calloc(workers, sizeof(int32_t));
        for (int32_t j = 0; j < workers; j++) {
            costs[i][j] = array[i * workers + j];
        }
    }

    SAP(workers, costs);

    for(int32_t i = 0; i < workers; i++) {
        free(costs[i]);
    }
    free(costs);
    return 0;
}