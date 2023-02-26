#include <stdlib.h>
#include <stdbool.h>

typedef struct Node {
    int32_t data;
    struct Node* next;
} Node;

void push(Node** head, int32_t data);
int32_t pop(Node** head);
void empty(Node** head);
bool isEmpty(Node** head);
Node* pushFirst(int32_t data);
void printList(Node* head);
