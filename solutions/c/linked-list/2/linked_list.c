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
   struct list *ptr = (struct list *)malloc(sizeof(struct list));
   ptr->first = NULL;
   ptr->last = NULL;
   return ptr;
}

size_t list_count(const struct list *list) {
   if(list->first == NULL) {
      return 0;
   } else if (list->first == list->last) {
      return 1;
   }

   struct list_node *ptr = list->first;
   size_t count = 1;
   do {
      ptr = ptr->next;
      count++;
   } while(ptr->next != NULL);
   return count;
}

void list_push(struct list *list, ll_data_t item_data) {
   struct list_node* new_node = (struct list_node*)malloc(sizeof(struct list_node));
   new_node->prev = list->last;
   new_node->next = NULL;
   new_node->data = item_data;
   
   if (list->first == NULL) {
      list->first = new_node;
      list->last = new_node;
   } else {
      list->last->next = new_node;
      list->last = new_node;
   }
}

ll_data_t list_pop(struct list *list) {
   if (list->first == NULL) {
      return 0;
   }
   
   ll_data_t data = list->last->data;
   if (list->first == list->last) {
      free(list->last);
      list->first = NULL;
      list->last = NULL;
   } else {
      list->last->prev->next = NULL;
      struct list_node *temp = list->last;
      list->last = list->last->prev;
      free(temp);
   }
   return data;
}

void list_unshift(struct list *list, ll_data_t item_data) {
   struct list_node* new_node = (struct list_node*)malloc(sizeof(struct list_node));
   new_node ->prev = NULL;
   new_node->next = list->first;
   new_node->data = item_data;

   if (list->first == NULL) {
      list->first = new_node;
      list->last = new_node;
   } else {
      list->first->prev = new_node;
      list->first = new_node;
   }
}

ll_data_t list_shift(struct list *list) {
   if (list->first == NULL) {
      return 0;
   }

   ll_data_t data = list->first->data;
   if (list->first == list->last) {
      free(list->first);
      list->first = NULL;
      list->last = NULL;
   } else {
      list->first->next->prev = NULL;
      struct list_node *temp = list->first;
      list->first = list->first->next;
      free(temp);
   }
   return data;
}

void list_delete(struct list *list, ll_data_t data) {
   struct list_node *ptr = list->first;
   while (ptr != NULL) {
      if (ptr->data == data) {
         break;
      } else {
         ptr = ptr->next;
      }
   }

   if (ptr != NULL) {
      if (list->first == list->last) {
         list->first = NULL;
         list->last = NULL;
         free(ptr);
      } else if (ptr->next == NULL) {
         list_pop(list);
      } else if (ptr->prev == NULL) {
         list_shift(list);
      } else {
         ptr->next->prev = ptr->prev;
         ptr->prev->next = ptr->next;
         free(ptr);
      }
   }
}

void list_destroy(struct list *list) {
   struct list_node *ptr = list->first;
   while (ptr != NULL) {
      struct list_node *temp = ptr;
      ptr = ptr->next;
      free(temp);
   }
   list->first = NULL;
   list->last = NULL;
   free(list);
   list = NULL;
}