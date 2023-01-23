#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>
#include "definitions.h"
#include <math.h>
#include "hashmap.h"

int parseFile(char** lines, char** combinedLines, char** bounds, char* binary, int32_t* details, int32_t numberOfLines) {

    int32_t combinedLinesIndex = 0, linesIndex = 1, size = 0;
    while(linesIndex < numberOfLines) {
        if (strstr(lines[linesIndex], "End") != NULL) {
            break;
        }
        while(strlen(lines[linesIndex]) <= 1) {
            linesIndex++;
        }
        if(strstr(lines[linesIndex], "Subject To") != NULL) {
            linesIndex ++;
        }
        if(linesIndex < numberOfLines && (strstr(lines[linesIndex], "Binary") != NULL || strstr(lines[linesIndex], "Bounds") != NULL)) {
            break;
        }
        strcat(combinedLines[combinedLinesIndex], lines[linesIndex] + 1);
        size = strlen(combinedLines[combinedLinesIndex]);
        while (combinedLines[combinedLinesIndex][size - 1] == ' ') {
            combinedLines[combinedLinesIndex][size - 1] = '\0';
            size --;
        }
        if(strchr(lines[linesIndex], '=') != NULL) {
            if (linesIndex + 1 < numberOfLines && strchr(lines[linesIndex + 1], ':') == NULL) {
                strcat(combinedLines[combinedLinesIndex], lines[linesIndex + 1] + 1);
                linesIndex ++;
            }
            combinedLinesIndex ++;
            linesIndex++;
            continue;
        }
        while(linesIndex + 1 < numberOfLines) {
            linesIndex ++;
            strcat(combinedLines[combinedLinesIndex], lines[linesIndex] + 1);
            size = strlen(combinedLines[combinedLinesIndex]);
            while (combinedLines[combinedLinesIndex][size - 1] == ' ') {
                combinedLines[combinedLinesIndex][size - 1] = '\0';
                size --;
            }
            if(strchr(lines[linesIndex], '=') != NULL) {
                linesIndex++;
                break;
            }

            if (linesIndex + 1 < numberOfLines && strlen(lines[linesIndex + 1]) <= 1) {
                linesIndex++;
                break;
            }
            
            if(linesIndex + 1 < numberOfLines && (strstr(lines[linesIndex + 1], "Binary") != NULL || strstr(lines[linesIndex + 1], "Bounds") != NULL)) {
                linesIndex ++;
                break;
            }
        }
        combinedLinesIndex ++;
    }

    while (linesIndex < numberOfLines && strstr(lines[linesIndex], "Bounds") != NULL) {
        if (strstr(lines[linesIndex], "Binary") != NULL) {
            break;
        }
        linesIndex ++;
    }
    int32_t numberOfBounds = 0;
    if (linesIndex != numberOfLines && strstr(lines[linesIndex], "Binary") == NULL) {
        
        while(strlen(lines[linesIndex]) >= 2) {
            if (strstr(lines[linesIndex], "Free") != NULL) {
                linesIndex ++;
                continue;
            }
            strcat(bounds[numberOfBounds], lines[linesIndex] + 1);
            linesIndex++;
            numberOfBounds ++;
        }
    }

    while (linesIndex < numberOfLines && strstr(lines[linesIndex], "Binary") == NULL) {
        linesIndex ++;
    }
    if (linesIndex != numberOfLines) {
        linesIndex++;   
        while(strlen(lines[linesIndex]) >= 2) {
            if(binary[0] == '\0') {
                strcat(binary, lines[linesIndex] + 1);
            } else {
                strcat(binary, lines[linesIndex]);
            }
            
            linesIndex++;
        }
    }
    details[0] = combinedLinesIndex;
    details[1] = numberOfBounds;
    return 0;
}
 
void convertStringToTerm(char* termString, int32_t multiplier, Term* term, struct hashmap* varsToIndex, int32_t* nextVarIndex) {
    while(termString && termString[0] == ' ') {
        termString ++;
    }
    if(strcmp(termString, "") == 0) {
        term->coefficient = 0;
        return;
    }
    int32_t size = strlen(termString);
    while (termString[size - 1] == ' ') {
        termString[size - 1] = '\0';
        size --;
    }

    char* termStringCopy = calloc(size, sizeof(char));
    char* end;
    char* base;
    double coefficient = 0;
    strcpy(termStringCopy, termString);

    char space[2] = " ";

    char* termTokens = strtok(termString, space);
    if (termTokens[0] == '0' && strlen(termTokens) == 1) {
        return;
    } 
    coefficient = multiplier * strtod(termTokens, &end);
    if (coefficient == 0) {
        coefficient = multiplier * 1;
    } else {
        termTokens = strtok(0, space);
    }

    int32_t terms[strlen(termString)];
    int32_t power[strlen(termString)];

    const char carat[3] = "^";

    int32_t counter = 0; 
    int32_t index;
    
    while(termTokens) {
        if(strchr(termTokens, '^') != NULL) {
            char *caratPos = strchr(termTokens, '^');
            index = (int32_t)(caratPos - termTokens);
        } else {
            index = (int32_t)strlen(termTokens);
        }
        base = calloc(index, sizeof(char));
        memcpy(base, termTokens, index);
        if (base && strcmp(base, "objvar") == 0) {
            terms[counter] = 0;
        } else {
            VarMap v;
            v.name = base;
            if (hashmap_get(varsToIndex, &v) == NULL) {
                v.index = *nextVarIndex;
                hashmap_set(varsToIndex, &v);
                *nextVarIndex += 1;
            }
            VarMap* w = hashmap_get(varsToIndex, &v);
            terms[counter] = w->index;
        }
        if(strchr(termTokens, '^') != NULL) {
            char* exponent = termTokens + index + 1;
            power[counter] = (int32_t)strtol(exponent, &end, 10);
        } else {
            power[counter] = 1;
        }
        
        counter ++;
        termTokens = strtok(0, space);
    }
    term->coefficient = coefficient;

    int32_t degreeOfTerm = 0;
    for(int i = 0 ; i < counter; i ++) {
        degreeOfTerm += power[i];
    }
    int32_t* varsList = calloc(degreeOfTerm, sizeof(int32_t));
    int32_t j = 0;
    for(int32_t i = 0; i < counter; i++) {
        for(int32_t k = 0; k < power[i]; k++) {
            varsList[j] = terms[i];
            j++;
        }
    }

    Var* variables = calloc(1, sizeof(Var));
    variables->index = varsList;
    variables->size = degreeOfTerm;
    variables->lowerBound = 0;
    variables->upperBound = 0;
    term->variables = variables;
}

char** processBoundString(char* line, int32_t* numberOfBounds) {
    const char equal[2] = "=";
    char** bounds = calloc(2, sizeof(char*));
    char* first = calloc(strlen(line), sizeof(char));
    strcpy(first, strtok(line, equal));
    char* second = calloc(strlen(line), sizeof(char));
    strcpy(second, strtok(0, equal));
    char* third = strtok(0, equal);
    strcat(first, equal);
    char* secondCopy = calloc(strlen(line), sizeof(char));
    memcpy(secondCopy, second, strlen(second));
    while(secondCopy[strlen(secondCopy) - 1] == '<' || secondCopy[strlen(secondCopy) - 1] == ' ') {
        secondCopy[strlen(secondCopy) - 1] = '\0';
    }
    strcat(first, secondCopy);
    bounds[0] = first;
    *numberOfBounds = 1;

    if(third != NULL) {
        strcat(second, equal);
        strcat(second, third);
        bounds[1] = second + 1;
        *numberOfBounds = 2;
    }
    free(secondCopy);
    return bounds;
}

Term** processEachSideOfConstraint(char* lhs, int32_t* numberOfTokens, bool isLhs, struct hashmap* varsToIndex, int32_t* nextVarIndex) {
    const char plus[2] = "+";
    const char minus[4] = "-";
    char* lhsCopy = calloc(1000000, sizeof(char));
    strcpy(lhsCopy, lhs);
    char* lhsSubtokens = strtok(lhs, plus);
    int32_t countSubtokens = 0;

    while(lhsSubtokens) {
        countSubtokens++;
        lhsSubtokens = strtok(0, plus);
    }

    char* subTokens[countSubtokens];

    subTokens[0] = strtok(lhsCopy, plus);
    for(int i = 1; i < countSubtokens; i ++) {
        subTokens[i] = strtok(0, plus);
    }
    int32_t countSubSubTokens = 0;
    char** copySubTokens = calloc(countSubtokens, sizeof(char*));
    for ( int i = 0; i < countSubtokens; i++ ) {
        copySubTokens[i] = calloc(strlen(subTokens[i]), sizeof(char));
        memcpy(copySubTokens[i], subTokens[i], strlen(subTokens[i]));
    }

    for(int i = 0; i < countSubtokens; i++) {
        char* subsubTokens = strtok(copySubTokens[i], minus);
        while(subsubTokens) {
            if (strlen(subsubTokens) != 1 || subsubTokens[0] != ' ') 
                countSubSubTokens ++;
            // if (subsubTokens[strlen(subsubTokens) - 1] != 'e') {
            //     strtok(0, minus);
            // }
            subsubTokens = strtok(0, minus);
        }
    }
    int multipliers[countSubSubTokens];
    char* subsubTokensList[countSubSubTokens];
    int32_t multiplier = 1, counter = 0, positiveCounter = 0;

    for ( int i = 0; i < countSubtokens; i++ ) {
        multiplier = isLhs ? 1: -1;
        positiveCounter = 0;
        char* subsubTokens = strtok(subTokens[i], minus);
        while(subsubTokens != NULL) {
            if (strcmp(subsubTokens, " ") != 0) {
                multipliers[counter] = multiplier;
                subsubTokensList[counter] = calloc(10000, sizeof(char));
                strcat(subsubTokensList[counter], minus);
                strcpy(subsubTokensList[counter], subsubTokens);
                if(subsubTokens && subsubTokens[strlen(subsubTokens) - 1] == 'e') {
                   subsubTokens = strtok(0, minus);
                   strcat(subsubTokensList[counter], minus);
                   strcat(subsubTokensList[counter], subsubTokens); 
                }
                positiveCounter = 1;
                counter ++;
            } else {
                multiplier = isLhs ? -1: 1;
            }
            if(positiveCounter == 1) {
                multiplier = isLhs ? -1: 1;
            }
            subsubTokens = strtok(0, minus);
        }
    }

    int32_t countZeroTerms = 0;
    Term** terms = calloc(counter, sizeof(Term*));
    
    for ( int32_t i = 0; i < counter; i++ ) {
        terms[i] = calloc(1, sizeof(Term));
        convertStringToTerm(subsubTokensList[i], multipliers[i], terms[i], varsToIndex, nextVarIndex);
        if (terms[i]->coefficient == 0) {
            countZeroTerms ++;
        }
    }

    *numberOfTokens = counter - countZeroTerms;

    for ( int i = 0; i < countSubtokens; i++ ) {
        free(copySubTokens[i]);
    }
    free(copySubTokens);

    int32_t pos = 0;
    Term** termsWithoutZeroes = calloc(counter - countZeroTerms, sizeof(Term*));
    for ( int i = 0; i < counter; i++ ) {
        if (terms[i]->coefficient == 0) {
            free(terms[i]);
            continue;
        }
        termsWithoutZeroes[pos] = calloc(1, sizeof(Term*));
        memcpy(termsWithoutZeroes[pos], terms[i], sizeof(Term));
        pos++;
        free(terms[i]);
    }
    free(terms);
    return termsWithoutZeroes;
}

Constraint* getBinaryConstraint(int32_t index, int32_t id) {
    Constraint* constraintObj = calloc(1, sizeof(Constraint));
    constraintObj->sense = EQUAL;
    constraintObj->degree = 2;
    constraintObj->numberOfTerms = 2;
    constraintObj->sizeOfIds = 1;
    CID* cid = calloc(1, sizeof(CID));
    cid->degree = 2;
    cid->id = id;
    constraintObj->ids = cid;
    Term** terms = calloc(2, sizeof(Term*));
    terms[0] = calloc(1, sizeof(Term));
    terms[1] = calloc(1, sizeof(Term));

    Var** vars = calloc(2, sizeof(Var));
    for(int32_t i = 0; i < 2; i++) {
        vars[i] = calloc(1, sizeof(Var));
    }
    vars[0]->index = calloc(2, sizeof(int32_t));
    vars[0]->index[0] = index;
    vars[0]->index[1] = index;
    vars[0]->size = 2;
    vars[0]->upperBound = 0;
    vars[0]->lowerBound = 0;

    vars[1]->index = calloc(1, sizeof(int32_t));
    vars[1]->index[0] = index;
    vars[1]->size = 1;
    vars[1]->upperBound = 0;
    vars[1]->lowerBound = 0;

    terms[0]->coefficient = 1;
    terms[0]->variables = vars[0];
    terms[1]->coefficient = -1;
    terms[1]->variables = vars[1];

    constraintObj->terms = terms;
    return constraintObj;
}


Constraint* processConstraint(char* constraint, int32_t* counts, struct hashmap* varsToIndex, int32_t* nextVarIndex) {
    const char delim[2] = "=";
    char* lhs = strtok(constraint, delim);
    char* rhs = strtok(0, delim);
    int32_t degree = 0;

    char sign = lhs[strlen(lhs) - 1];

    cSense sense = EQUAL;
    switch(sign) {
        case '<': sense = LESSER; break;
        case '>': sense = GREATER; break;
        default: sense = EQUAL; 
    }
    lhs[strlen(lhs) - 1] = '\0';
    if(strchr(lhs, ':') != NULL)
        lhs = strchr(lhs, ':') + 1;

    int32_t* lhsTokens = calloc(1, sizeof(int32_t));
    int32_t* rhsTokens = calloc(1, sizeof(int32_t));
    Term** lTokens;
    Term** rTokens;
    Term** allTokens;
    lTokens = processEachSideOfConstraint(lhs, lhsTokens, true, varsToIndex, nextVarIndex);
    rTokens = processEachSideOfConstraint(rhs, rhsTokens, false, varsToIndex, nextVarIndex);

    allTokens = calloc(*lhsTokens + *rhsTokens, sizeof(Term*));

    for(int32_t i = 0; i < *lhsTokens; i++) {
        allTokens[i] = calloc(1, sizeof(Term));
        memcpy(allTokens[i], lTokens[i], sizeof(Term));
        degree = fmax(degree, allTokens[i]->variables->size);
    }
    for(int32_t i = *lhsTokens; i < *lhsTokens + *rhsTokens; i++) {
        allTokens[i] = calloc(1, sizeof(Term));
        memcpy(allTokens[i], rTokens[i - *lhsTokens], sizeof(Term));
        degree = fmax(degree, allTokens[i]->variables->size);
    }

    Constraint* constraintObj = calloc(1, sizeof(Constraint));
    constraintObj->sense = sense;
    constraintObj->degree = degree;
    constraintObj->numberOfTerms = *lhsTokens + *rhsTokens;
    constraintObj->terms = allTokens;
    constraintObj->sizeOfIds = 1;

    CID* cid = calloc(1, sizeof(CID));
    cid->degree = degree;
    counts[degree]++;
    cid->id = counts[degree];

    constraintObj->ids = cid;

    free(lhsTokens);
    free(rhsTokens);
    return constraintObj;
}

int compare(const void *a, const void *b, void *udata) {
    const VarMap *varA = a;
    const VarMap *varB = b;
    return strcmp(varA->name, varB->name);
}

uint64_t hash(const void *item, uint64_t seed0, uint64_t seed1) {
    const VarMap *var = item;
    return hashmap_sip(var->name, strlen(var->name), seed0, seed1);
}

 int main() {
    size_t MAX_NUMBER_OF_LINES = 10000, MAX_LINE_WIDTH = 1000, MAX_DEGREE = 20;
    char **lines;
    int32_t* counts = calloc(MAX_DEGREE + 1, sizeof(int32_t));

    int32_t* nextVarIndex = calloc(1, sizeof(int32_t));
    *nextVarIndex = 1;
    struct hashmap* varsToIndex = hashmap_new(sizeof(VarMap), 0, 0, 0, &hash, &compare, NULL, NULL);

    FILE *fp = fopen ("arki0003.pip.txt", "r");
    
    if (!fp) {
        perror ("Cannot Open File");
        return 1;
    }
    
    int32_t i = 0, boundsCounter = 0;
    lines = calloc(MAX_NUMBER_OF_LINES, sizeof (*lines));
    lines[0] = calloc(MAX_LINE_WIDTH, sizeof(char));
    while (fgets (lines[i], MAX_LINE_WIDTH, fp)) {
        if (lines[i][0] == '\\') {
            continue;
        }
        lines[i][strcspn(lines[i], "\n")] = 0;
        i++;
        lines[i] = calloc(MAX_LINE_WIDTH, sizeof(char));
    }    

    int32_t numberOfLines = i;

    fclose (fp);
    char** combinedLines;
    char** boundsString;
    int32_t* numberOfBounds = calloc(1, sizeof(int32_t));
    char** bounds;
    char* binary = calloc(1000000, sizeof(char));
    combinedLines = calloc(numberOfLines, sizeof(*combinedLines));
    bounds = calloc(numberOfLines, sizeof(*bounds));
    for(int32_t j = 0; j < numberOfLines; j++) {
        bounds[j] = calloc(MAX_LINE_WIDTH, sizeof(char));
        combinedLines[j] = calloc(1000000, sizeof(char));
    }
    int32_t *details = calloc(2, sizeof(int32_t));
    parseFile(lines, combinedLines, bounds, binary, details, numberOfLines);

    int32_t start = 0;

    if (strstr(combinedLines[0], "objvar") != NULL) {
        start ++;
    }
    int32_t numberOfBinary = 0;
    if(strcmp(binary, "") != 0) {
        numberOfBinary = 1;
        for(int32_t j = 0; j < strlen(binary);j++) {
            if (binary[j] == ' ') {
                numberOfBinary ++;
            }
        }
    }

    Constraint** constraints = calloc(details[0] - start + numberOfBinary, sizeof(Constraint*));

    for(int32_t j = start; j < details[0]; j++) {
        if (j == 0) {
            if (strstr(lines[0], "Min") != NULL) {
                strcat(combinedLines[0], " >= objvar");
                constraints[0] = processConstraint(combinedLines[0], counts, varsToIndex, nextVarIndex);
            } else {
                strcat(combinedLines[0], " <= objvar");
                constraints[0] = processConstraint(combinedLines[0], counts, varsToIndex, nextVarIndex);
            }
        } else {
            constraints[j - start] = processConstraint(combinedLines[j], counts, varsToIndex, nextVarIndex);
        }
        displayConstraint(constraints[j-start]);
        printf("\n");
    }

    Constraint** boundsConstraints = calloc(2 * (details[1] + numberOfBinary), sizeof(Constraint*));
    const char space[2] = " ";
    char** binaryVariables = calloc(numberOfBinary, sizeof(char*));
    if (numberOfBinary > 0)
        binaryVariables[0] = strtok(binary, space);
        for(int32_t j = 1; j < numberOfBinary; j++ ){
            binaryVariables[j] = strtok(0, space);
        }
    

    for(int32_t j = 0; j < numberOfBinary; j++ ){
        VarMap v;
        v.name = binaryVariables[j]; 
        VarMap* w = hashmap_get(varsToIndex, &v);

        char* varName1 = calloc(strlen(binaryVariables[j]), sizeof(char));
        char* varName2 = calloc(strlen(binaryVariables[j]), sizeof(char));
        memcpy(varName1, binaryVariables[j], strlen(binaryVariables[j]));
        memcpy(varName2, binaryVariables[j], strlen(binaryVariables[j]));
        strcat(varName1, " >= 0");
        strcat(varName2, " <= 1");
        constraints[details[0] - start + j] = getBinaryConstraint(w->index, counts[2] + 1);
        boundsConstraints[boundsCounter] = processConstraint(varName1, counts, varsToIndex, nextVarIndex);
        boundsConstraints[boundsCounter + 1] = processConstraint(varName2, counts, varsToIndex, nextVarIndex);
        boundsCounter += 2;
        counts[2] ++;
        displayConstraint(constraints[details[0]-start + j]);
        printf("\n");
        free(varName1);
        free(varName2);
    }

    for(int32_t j = 0; j < details[1]; j++ ){
        boundsString = processBoundString(bounds[j], numberOfBounds);
        for (int32_t k = 0; k < *numberOfBounds; k++) {
            boundsConstraints[boundsCounter] = processConstraint(boundsString[k], counts, varsToIndex, nextVarIndex);
            boundsCounter++;
        }
    }

    for(int32_t j = 0; j < boundsCounter; j++) {
        displayConstraint(boundsConstraints[j]);
        printf("\n");
    }

    for(int32_t j = 0; j < numberOfLines; j++) {
        free(lines[j]);
        free(combinedLines[j]);
        free(bounds[j]);
    }

    free(binary);
    free(bounds);
    free(combinedLines);
    free (lines);
    return 0;
 }