#include <stdlib.h>
#include "linked_list.h"

struct list_node {
   struct list_node *prev, *next;
   ll_data_t data;
};

struct list {
   struct list_node *first, *last;
};

struct list *list_create(void) {
   return malloc(sizeof(struct list));
}

void list_destroy(struct list *list) {
   free(list);
}

void list_push(struct list *list, ll_data_t item_data) {
   struct list_node* newNode = (struct list_node*)malloc(sizeof(struct list_node));
   newNode->data = item_data;
   newNode->next = NULL;

   struct list_node* temp = list->first;
   if (list->first == NULL) {
      newNode->prev = NULL;
      list->first = newNode;
      return;
   }

   while(temp->next != NULL) {
      temp = temp->next;
   }

   temp->next = newNode;
   newNode->prev = temp;

   if (list->last == NULL) {
      newNode->next = NULL;
      list->last = newNode;
   }
   
}

ll_data_t list_pop(struct list *list) {
   struct list_node* temp = list->first;
   
   while(temp->next != NULL) {
      temp = temp->next;
   }
   return temp->data;
}