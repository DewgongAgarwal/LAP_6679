#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <limits.h>

void printArray(int32_t* a, int32_t size) {
    for(int32_t i = 0; i < size; i++) {
        printf("%d, ", a[i]);
    }
    printf("\n");
}

void subtractRowMin(int32_t** costs, int32_t workers) {
    int32_t min = INT_MAX;
    for(int32_t i = 0; i < workers; i++) {
        for(int32_t j = 0; j < workers; j++) {
            if (costs[i][j] < min) {
                min = costs[i][j];
            }
        }
        for(int32_t j = 0; j < workers; j++) {
            costs[i][j] -= min;
        }
        min = INT_MAX;
    }
}

void subtractColMin(int32_t** costs, int32_t workers) {
    int32_t min = INT_MAX;
    for(int32_t i = 0; i < workers; i++) {
        for(int32_t j = 0; j < workers; j++) {
            if (costs[j][i] < min) {
                min = costs[j][i];
            }
        }
        for(int32_t j = 0; j < workers; j++) {
            costs[j][i] -= min;
        }
        min = INT_MAX;
    }
}

void markStarred(int32_t** costs, int32_t workers) {

    bool row[workers], col[workers];
    for(int32_t i = 0; i < workers; i++) {
        row[i] = false;
        col[i] = false;
    }

    for(int32_t i = 0; i < workers; i++) {
        for(int32_t j = 0; j < workers; j++) {
            if (costs[i][j] == 0) {
                if (!row[i] && !col[j]) {
                    costs[i][j] = -1;
                    row[i] = true;
                    col[j] = true;
                }
            }
        }
    }
}

bool coverColumns(int32_t** costs, int32_t workers, bool* col) {
    // printMatrix(costs, workers);
    int32_t count = 0;
    for(int32_t i = 0; i < workers; i++) {
        for(int32_t j = 0; j < workers; j++) {
            if (costs[i][j] == -1) {
                col[j] = true;
                count++;
            }
        }
    }
    if (count == workers) {
        return true;
    }
    return false;
}

int32_t findAndPrintCost(int32_t** costs, int32_t** costsCopy, int32_t workers, bool print) {
    
    int32_t cost = 0;
    int32_t assigned[workers];
    for(int32_t i = 0; i < workers; i++) {
        for(int32_t j = 0; j < workers; j++) {
            if (costs[i][j] == -1) {
                cost += costsCopy[i][j];
                assigned[i] = j;
            }
        }
    }
    if (print) {
        printf("Cost = %d\n", cost);
        printf("\nAssignments:\n");
        printArray(assigned, workers);
    }
    return cost;
}

int32_t hasStarredZeroInRow(int32_t** costs, int32_t workers, int32_t row) {
    for(int32_t i = 0; i < workers; i++) {
        if (costs[row][i] == -1) {
            return i;
        }
    }
    return -1;
}

int32_t hasStarredZeroInCol(int32_t** costs, int32_t workers, int32_t col) {
    for(int32_t i = 0; i < workers; i++) {
        if (costs[i][col] == -1) {
            return i;
        }
    }
    return -1;
}


int32_t hasPrimedZeroInRow(int32_t** costs, int32_t workers, int32_t row) {
    for(int32_t i = 0; i < workers; i++) {
        if (costs[row][i] == -2) {
            return i;
        }
    }
    return -1;
}

void findUncoveredZero(int32_t** costs, int32_t workers, bool* row, bool* col, int32_t* rowZ, int32_t* colZ) {
    for(int32_t i = 0; i < workers; i++) {
        for(int32_t j = 0; j < workers; j++) {
            if (costs[i][j] == 0 && !row[i] && !col[j]) {
                *rowZ = i;
                *colZ = j;
                return;
            }
        }
    }
    *rowZ = -1;
    *colZ = -1;
}

void step5(int32_t** costs, int32_t workers, bool* row, bool* col, int32_t* rowZ, int32_t* colZ) {
    int32_t rowZCopy = *rowZ;
    int32_t colZCopy = *colZ;
    int32_t count = 0;
    int32_t* rowZArray = calloc(workers, sizeof(int32_t));
    int32_t* colZArray = calloc(workers, sizeof(int32_t));
    rowZArray[count] = rowZCopy;
    colZArray[count] = colZCopy;
    count++;
    while(true) {
        rowZCopy = hasStarredZeroInCol(costs, workers, colZCopy);
        if (rowZCopy == -1) {
            break;
        }
        rowZArray[count] = rowZCopy;
        colZArray[count] = colZCopy;
        count++;
        colZCopy = hasPrimedZeroInRow(costs, workers, rowZCopy);
        if (colZCopy == -1) {
            break;
        }
        rowZArray[count] = rowZCopy;
        colZArray[count] = colZCopy;
        count++;
    }

    for(int32_t i = 0; i < count; i++) {
        if (costs[rowZArray[i]][colZArray[i]] == -1) {
            costs[rowZArray[i]][colZArray[i]] = -2;
        } else {
            costs[rowZArray[i]][colZArray[i]] = -1;
        }
    }

    for(int32_t i = 0; i < workers; i++) {
        for(int32_t j = 0; j < workers; j++) {
            if (costs[i][j] == -2) {
                costs[i][j] = 0;
            }
        }
    }

    for(int32_t i = 0; i < workers; i++) {
        row[i] = false;
        col[i] = false;
    }
    free(rowZArray);
    free(colZArray);
}

bool processUncoveredZero(int32_t** costs, int32_t workers, bool* row, bool* col, int32_t* rowZ, int32_t* colZ) {
    int32_t starredZeroCol = -1;
    bool goToStep3 = false;
    if (costs[*rowZ][*colZ] == 0 && !row[*rowZ] && !col[*colZ]) {
        costs[*rowZ][*colZ] = -2;
    }
    starredZeroCol = hasStarredZeroInRow(costs, workers, *rowZ);
    if(starredZeroCol == -1) {
        step5(costs, workers, row, col, rowZ, colZ);
        goToStep3 = true;
    } else {
        row[*rowZ] = true;
        col[starredZeroCol] = false; 
    }
    return goToStep3;
}

void step6(int32_t** costs, int32_t workers, bool* row, bool* col) {
    int32_t min = INT_MAX;
    for(int32_t i = 0; i < workers; i++) {
        for(int32_t j = 0; j < workers; j++) {
            if (!row[i] && !col[j]) {
                if (costs[i][j] < min) {
                    min = costs[i][j];
                }
            }
        }
    }
    for(int32_t i = 0; i < workers; i++) {
        for(int32_t j = 0; j < workers; j++) {
            if (row[i]) {
                costs[i][j] += min;
            }
            if (!col[j]) {
                costs[i][j] -= min;
            }
        }
    }
}

bool step4(int32_t** costs, int32_t workers, bool* row, bool* col) {
    int32_t* rowZ = calloc(1, sizeof(int32_t));
    int32_t* colZ = calloc(1, sizeof(int32_t));
    bool goToStep3 = false;
    findUncoveredZero(costs, workers, row, col, rowZ, colZ);
    while(*rowZ != -1 && *colZ != -1) {
        goToStep3 = processUncoveredZero(costs, workers, row, col, rowZ, colZ);
        if (goToStep3) {
            break;
        }
        findUncoveredZero(costs, workers, row, col, rowZ, colZ);
    }
    if (!goToStep3) {
        step6(costs, workers, row, col);
        return true;
    }
    else {
        return false;
    }
    free(rowZ);
    free(colZ);
}


void hungarian(int32_t workers, int32_t** costs) {
    int32_t cost = 0;
    bool done = false, repeatStep4 = false;

    int32_t** costsCopy = calloc(workers, sizeof(int32_t*));
    for(int32_t i = 0; i < workers; i++) {
        costsCopy[i] = calloc(workers, sizeof(int32_t));
        for (int32_t j = 0; j < workers; j++) {
            costsCopy[i][j] = costs[i][j];
        }
    }

    subtractRowMin(costs, workers);
    subtractColMin(costs, workers);

    bool* row = calloc(workers, sizeof(bool));
    bool* col = calloc(workers, sizeof(bool));
    for(int32_t i = 0; i < workers; i++) {
        row[i] = false;
        col[i] = false;
    }
    markStarred(costs, workers);
    while (!done) {
        if (coverColumns(costs, workers, col)) {
            done = true;
        } else {
            do {
                repeatStep4 = step4(costs, workers, row, col);
            } while(repeatStep4);
        }
    }
    free(row);
    free(col);
    cost = findAndPrintCost(costs, costsCopy, workers, true);

    for(int32_t i = 0; i < workers; i++) {
        free(costsCopy[i]);
    }
    free(costsCopy);
}

void generateCosts(int32_t** costs, int32_t workers) {
    for(int32_t i = 0; i < workers; i++) {
        for(int32_t j = 0; j < workers; j++) {
            costs[i][j] = rand() % workers;
        }
    }
}

int main() {
    for (int32_t j = 0; j < 1; j++) {
        int32_t workers = 5;
        int32_t array[25] = {9, 22, 58, 11, 19, 43, 78, 72, 50, 63, 41, 28, 91, 37, 45, 74, 42, 27, 49, 39, 36, 11, 57, 22, 25};
        int32_t** costs = calloc(workers, sizeof(int32_t*));
        for(int32_t i = 0; i < workers; i++) {
            costs[i] = calloc(workers, sizeof(int32_t));
            for (int32_t j = 0; j < workers; j++) {
                costs[i][j] = array[i * workers + j];
            }
        }
        hungarian(workers, costs);
        for(int32_t i = 0; i < workers; i++) {
            free(costs[i]);
        }
        free(costs);
    }
    return 0;
}
