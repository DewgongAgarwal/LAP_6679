#include <stdlib.h>
#include "types.h"
#include <stdbool.h>
#include <string.h>
#include <stdio.h>

void push(Node** head, int32_t data) {
    Node* newNode = calloc(1, sizeof(Node));
    newNode->data = data;
    newNode->next = *head;
    *head = newNode;
}

Node* pushFirst(int32_t data) {
    Node* newNode = calloc(1, sizeof(Node));
    newNode->data = data;
    newNode->next = NULL;
    return newNode;
}

int32_t pop(Node** head) {
    Node* temp = *head;
    int32_t data = temp->data;
    *head = temp->next;
    free(temp);
    return data;
}

bool isEmpty(Node** head) {
    return *head == 0;
}

void empty(Node** head) {
    while (*head != NULL) {
        pop(head);
    }
}

//print linkedlist
void printList(Node* head) {
    Node *tempHead = calloc(1, sizeof(Node));
    memcpy(tempHead, head, sizeof(Node));
    while (tempHead != NULL) {
        printf("%d ", tempHead->data);
        tempHead = tempHead->next;
    }
    printf("\n");
}
