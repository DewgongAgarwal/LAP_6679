#include "definitions.h"
#include <math.h>
#include <stdlib.h>
#include <stdio.h>
#include <stdbool.h>

static void mergeArrays(int32_t *merged, int32_t *first, int32_t *second, size_t sizeFirst, size_t sizeSecond)
{
    int32_t indexOfFirst = 0, indexOfSecond = 0, indexOfMerged = 0;

    while (indexOfFirst < sizeFirst && indexOfSecond < sizeSecond)
    {
        if (first[indexOfFirst] <= second[indexOfSecond])
        {
            merged[indexOfMerged] = first[indexOfFirst];
            indexOfFirst++;
        }
        else
        {
            merged[indexOfMerged] = second[indexOfSecond];
            indexOfSecond++;
        }
        indexOfMerged++;
    }

    while (indexOfFirst < sizeFirst)
    {
        merged[indexOfMerged] = first[indexOfFirst];
        indexOfFirst++;
        indexOfMerged++;
    }

    while (indexOfSecond < sizeSecond)
    {
        merged[indexOfMerged] = second[indexOfSecond];
        indexOfSecond++;
        indexOfMerged++;
    }
}

static void mergeIdArrays(CID *merged, CID *first, CID *second, size_t sizeFirst, size_t sizeSecond)
{
    int32_t indexOfFirst = 0, indexOfSecond = 0, indexOfMerged = 0;

    while (indexOfFirst < sizeFirst && indexOfSecond < sizeSecond)
    {
        if (first[indexOfFirst].degree < second[indexOfSecond].degree)
        {
            merged[indexOfMerged] = first[indexOfFirst];
            indexOfFirst++;
        }
        else if ((first[indexOfFirst].degree == second[indexOfSecond].degree) &&
                 (first[indexOfFirst].id < second[indexOfSecond].id))
        {
            merged[indexOfMerged] = first[indexOfFirst];
            indexOfFirst++;
        }
        else
        {
            merged[indexOfMerged] = second[indexOfSecond];
            indexOfSecond++;
        }
        indexOfMerged++;
    }

    while (indexOfFirst < sizeFirst)
    {
        merged[indexOfMerged] = first[indexOfFirst];
        indexOfFirst++;
        indexOfMerged++;
    }

    while (indexOfSecond < sizeSecond)
    {
        merged[indexOfMerged] = second[indexOfSecond];
        indexOfSecond++;
        indexOfMerged++;
    }
}

void updateUpperBound(Var *x, double upperBound)
{
    if (!(x->upperBound))
    {
        x->upperBound = (double *)calloc(1, sizeof(double));
        *(x->upperBound) = upperBound;
    }
    else
    {
        *(x->upperBound) = fmin(*(x->upperBound), upperBound);
    }
}

void updateLowerBound(Var *x, double lowerBound)
{
    if (!(x->lowerBound))
    {
        x->lowerBound = (double *)calloc(1, sizeof(double));
        *(x->lowerBound) = lowerBound;
    }
    else
    {
        *(x->lowerBound) = fmax(*(x->lowerBound), lowerBound);
    }
}

Var *multiplyVars(Var *x, Var *y)
{
    Var *newVariable = calloc(1, sizeof(Var));
    newVariable->upperBound = 0;
    newVariable->lowerBound = 0;
    newVariable->size = x->size + y->size;
    newVariable->index = (int32_t *)calloc(newVariable->size, sizeof(int32_t));
    mergeArrays(newVariable->index, x->index, y->index, x->size, y->size);
    return newVariable;
}

void freeVar(Var *x)
{
    free(x->index);
    free(x);
}

Term* multiplyTerms(Term *x, Term *y)
{
    Term *newTerm = calloc(1, sizeof(Term));
    newTerm->coefficient = x->coefficient * y->coefficient;
    if (!(x->variables || y->variables))
    {
        newTerm->variables = 0;
    }
    else if (!(x->variables) && y->variables)
    {
        newTerm->variables = y->variables;
    }
    else if (x->variables && !(y->variables))
    {
        newTerm->variables = x->variables;
    }
    else
    {
        newTerm->variables = multiplyVars(x->variables, y->variables);
    }
    return newTerm;
}

void negateTerm(Term *x)
{
    x->coefficient = -1 * x->coefficient;
}

void freeTerm(Term *x)
{
    free(x->variables);
    free(x);
}

cSense multiplySense(cSense x, cSense y)
{
    if (x == EQUAL || y == EQUAL)
    {
        return EQUAL;
    }
    else if (x == y)
    {
        return GREATER;
    }
    else
    {
        return LESSER;
    }
}

bool canMultiply(Constraint *x, Constraint *y) {
    int32_t indexOfFirst = 0, indexOfSecond = 0;

    while(indexOfFirst < x->sizeOfIds && indexOfSecond < y->sizeOfIds) {

        if (((x->ids)[indexOfFirst]).degree < ((y->ids)[indexOfSecond]).degree) {
            indexOfFirst ++;
        }
        else if ((((x->ids)[indexOfFirst]).degree == ((y->ids)[indexOfSecond]).degree) && 
                (((x->ids)[indexOfFirst]).id < ((y->ids)[indexOfSecond]).id)) {
            indexOfFirst ++;
        }
        else if ((((x->ids)[indexOfFirst]).degree == ((y->ids)[indexOfSecond]).degree) && 
                (((x->ids)[indexOfFirst]).id == ((y->ids)[indexOfSecond]).id)) {
            return false;
        }
        else {
            indexOfSecond ++;
        }

    }
    return true;
}

CID* multiplyIds(CID *x, CID *y, size_t sizex, size_t sizey)
{
    CID* newIds = (CID*) calloc(sizex + sizey, sizeof(CID));
    mergeIdArrays(newIds, x, y, sizex, sizey);
    return newIds;
}

Constraint *multiplyConstraint(Constraint *x, Constraint *y)
{
    Constraint *newConstraint = (Constraint *)calloc(1, sizeof(Constraint));
    newConstraint->numberOfTerms = x->numberOfTerms * y->numberOfTerms;
    newConstraint->degree = x->degree + y->degree;
    newConstraint->sense = multiplySense(x->sense, y->sense);

    Term** terms = (Term**)calloc(newConstraint->numberOfTerms, sizeof(Term*));
    int32_t index = 0;

    for (int32_t i = 0; i < x->numberOfTerms; i++)
    {
        for (int32_t j = 0; j < y->numberOfTerms; j++)
        {
            terms[index] = multiplyTerms(x->terms[i], y->terms[j]);
            index++;
        }
    }
    newConstraint->terms = terms;

    newConstraint->sizeOfIds = x->sizeOfIds + y->sizeOfIds;
    newConstraint->ids = multiplyIds(x->ids, y->ids, x->sizeOfIds, y->sizeOfIds);

    return newConstraint;
}

void negateConstraint(Constraint *x)
{
    for (int32_t i = 0; i < x->numberOfTerms; i++)
    {
        negateTerm((x->terms)[i]);
    }
}

void freeConstraint(Constraint *x)
{
    for (int32_t i = 0; i < x->numberOfTerms; i++)
    {
        freeTerm((x->terms)[i]);
    }
    free(x->ids);
    free(x->terms);
    free(x);
}

void displayConstraint(Constraint* x) {
    for (size_t i = 0; i < x->numberOfTerms; i++) {
        printf("%f | ", (x->terms)[i]->coefficient);
        for(size_t j = 0; j < (x->terms)[i]->variables->size; j++) {
            printf("%d ", ((x->terms)[i]->variables->index)[j]);
        }
        printf(" ; ");
    }
    printf("||| %d |||", x->sense);
}

// int main()
// {
//     Var variable1, variable2;
//     int32_t index1[] = {1, 3};
//     int32_t index2[] = {1, 2, 4};
//     variable1.upperBound = 0;
//     variable1.lowerBound = 0;
//     variable2.upperBound = 0;
//     variable2.lowerBound = 0;
//     variable1.index = index1;
//     variable1.size = 2;
//     variable2.index = index2;
//     variable2.size = 3;

//     Term t1, t2;
//     t1.coefficient = 1;
//     t2.coefficient = 2;
//     t1.variables = &variable1;
//     t2.variables = &variable2;

//     Constraint c1, c2;

//     c1.degree = 2;
//     c2.degree = 3;
//     CID cid1, cid2;
//     cid1.degree = 2; 
//     cid1.id = 1;
//     cid2.degree = 3;
//     cid2.id = 1;

//     CID cidarray1[] = {cid1};
//     CID cidarray2[] = {cid2};
    
//     Term* termArray1[] = {&t1, &t2};
//     Term* termArray2[] = {&t2};

//     c1.ids = cidarray1;
//     c2.ids = cidarray2;
//     c1.numberOfTerms = 2;
//     c2.numberOfTerms = 1;
//     c1.sense = LESSER;
//     c2.sense = GREATER;
//     c1.sizeOfIds = 1;
//     c2.sizeOfIds = 1;
//     c1.terms = termArray1;
//     c2.terms = termArray2;

//     bool m1, m2, m3;

//     m1 = canMultiply(&c1, &c2);
//     m2 = canMultiply(&c1, &c1);
//     m3 = canMultiply(&c2, &c2);

//     if (m1) {
//         printf("m1 is True\n");
//     }
//     else {
//         printf("m1 is False\n");
//     }

//     if (m2) {
//         printf("m2 is True\n");
//     }
//     else {
//         printf("m2 is False\n");
//     }

//     if (m3) {
//         printf("m3 is True\n");
//     }
//     else {
//         printf("m3 is False\n");
//     }

//     Constraint* newConstraint = multiplyConstraint(&c1, &c2);

//     printf("%d\n", newConstraint->degree);
//     printf("%ld\n", newConstraint->numberOfTerms);
//     printf("%d\n", newConstraint->sense);
//     printf("%ld\n", newConstraint->sizeOfIds);
//     for (size_t i = 0; i < newConstraint->sizeOfIds; i++) {
//         printf("%d, %d\n", (newConstraint->ids)[i].degree, (newConstraint->ids)[i].id);
//     }

//     for (size_t i = 0; i < newConstraint->numberOfTerms; i++) {
//         for(size_t j = 0; j < (newConstraint->terms)[i]->variables->size; j++) {
//             printf("%d ", ((newConstraint->terms)[i]->variables->index)[j]);
//         }
//         printf("\n");
//     }

//     freeConstraint(newConstraint);

//     return 0;
// }