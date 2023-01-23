#ifndef RLT_DEFINITIONS_H_
#define RLT_DEFINITIONS_H_

#include <stdint.h>
#include <stddef.h>
#include <stdbool.h>

// Components of Variables

typedef struct variable {
    int32_t* index;
    size_t size;
    double* upperBound;
    double* lowerBound;
} Var;

Var* multiplyVars(Var* x, Var* y);
void updateUpperBound(Var* x, double upperBound);
void updateLowerBound(Var* x, double lowerBound);
void freeVar(Var* x);

// Components of Terms

typedef struct term {
    Var* variables;
    double coefficient;
} Term;

Term* multiplyTerms(Term* x, Term* y);
void negateTerm(Term* x);
void freeTerm(Term* x);


// Components of Constraints

typedef struct constraintId {
    uint32_t degree;
    uint32_t id;
} CID;


typedef enum constraintSense {
    GREATER,
    LESSER,
    EQUAL
} cSense;

cSense multiplySense(cSense x, cSense y);

typedef struct constraint
{
    Term** terms;
    size_t numberOfTerms;
    cSense sense;
    uint32_t degree;
    CID* ids;
    size_t sizeOfIds;
} Constraint;

bool canMultiply(Constraint* x, Constraint* y);
CID* multiplyIds(CID *x, CID *y, size_t sizex, size_t sizey);
Constraint* multiplyConstraint(Constraint* x, Constraint* y);
void negateConstraint(Constraint* x);
void freeConstraint(Constraint* x);
void displayConstraint(Constraint* x);

typedef struct varMap {
    char* name;
    int32_t index;
} VarMap;

#endif  // RLT_DEFINITIONS_H_