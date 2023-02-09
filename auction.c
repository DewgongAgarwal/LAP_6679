#include <stdlib.h>
#include <stdio.h>
#include <stdbool.h>

int32_t findAssignedWorker(int32_t* assigned, int32_t task, int32_t workers) {
    int32_t worker = 0;
    for(int32_t i = 0; i < workers; i++) {
        if (assigned[i] == task) {
            worker = i;
            break;
        }
    }
    return worker;
}

int32_t largest(int32_t* costs, int32_t* prices, int32_t workers, int32_t startIndex, int32_t sense) {

    if (startIndex >= workers) {
        startIndex = 0;
    }

    int32_t maxValue = sense * costs[startIndex] - prices[startIndex];
    int32_t maxIndex = startIndex;

    for (int32_t i = startIndex + 1; i < workers; i++) {
        if (maxValue < sense * costs[i] - prices[i]) {
            maxValue = sense * costs[i] - prices[i];
            maxIndex = i;
        }
    }
    return maxIndex;
}

int32_t secondLargest(int32_t* costs, int32_t* prices, int32_t workers, int32_t indexOfMax, int32_t sense) {
    if (indexOfMax == 0) {
        return largest(costs, prices, workers, 1, sense);
    }
    int32_t secondMaxValue = sense * costs[0] - prices[0];
    int32_t secondMaxIndex = 0;

    for (int32_t i = 1; i < workers; i++) {
        if (i == indexOfMax) {
            continue;
        }
        if (secondMaxValue < sense * costs[i] - prices[i]) {
            secondMaxValue = sense * costs[i] - prices[i];
            secondMaxIndex = i;
        }
    }
    return secondMaxIndex;
}

int32_t everyoneSatisfied(int32_t** costs, int32_t* assigned, int32_t* prices, int32_t workers, int32_t sense) {
    int32_t satisfied = true;
    float eps = 0.5;
    int32_t worker = 0;
    int32_t index = 0;
    for (worker = 0; worker < workers; worker++) {
        index = largest(costs[worker], prices, workers, 0, sense);
        if (index != assigned[worker]) {
            if(sense * costs[worker][index] - prices[index] - sense * costs[worker][assigned[worker]] + prices[assigned[worker]] > eps) {
                satisfied = false;
                break;
            }
        }
    }

    if (satisfied) {
        return true;
    }

    int32_t oldWorker = findAssignedWorker(assigned, index, workers);
    assigned[oldWorker] = assigned[worker];
    assigned[worker] = index;

    int32_t v = sense * costs[worker][index] - prices[index];
    int32_t secondLargestIndex = secondLargest(costs[worker], prices, workers, index, sense);
    int32_t w = sense * costs[worker][secondLargestIndex] - prices[secondLargestIndex];
    prices[index] = prices[index] + v - w + eps;
 
    return false;
}

void printArray(int32_t* a, int32_t size) {
    for(int32_t i = 0; i < size; i++) {
        printf("%d, ", a[i]);
    }
    printf("\n");
}

void auction(int32_t workers, int32_t** costs, int32_t sense) {

    int32_t* assigned = calloc(workers, sizeof(int32_t));
    int32_t* prices = calloc(workers, sizeof(int32_t));

    for (int32_t i = 0; i < workers; i++) {
        assigned[i] = i;
        prices[i] = 0;
    }
    while(!everyoneSatisfied(costs, assigned, prices, workers, sense));

    int32_t cost = 0;
    for(int32_t i = 0; i < workers; i++) {
        cost += costs[i][assigned[i]];
    }
    printf("Cost = %d\n", cost);
    printf("\nAssignments:\n");
    printArray(assigned, workers);
    free(assigned);
    free(prices);
}

int main() {
    int32_t workers = 5;
    int32_t sense = -1; // -1 is minimize and 1 is maximize
    int32_t array[25] = {9, 22, 58, 11, 19, 43, 78, 72, 50, 63, 41, 28, 91, 37, 45, 74, 42, 27, 49, 39, 36, 11, 57, 22, 25};
    int32_t** costs = calloc(workers, sizeof(int32_t*));
    for(int32_t i = 0; i < workers; i++) {
        costs[i] = calloc(workers, sizeof(int32_t));
        for (int32_t j = 0; j < workers; j++) {
            costs[i][j] = array[i * workers + j];
        }
    }

    auction(workers, costs, sense);

    for(int32_t i = 0; i < workers; i++) {
        free(costs[i]);
    }
    free(costs);
    return 0;
}