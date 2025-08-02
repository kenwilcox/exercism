//#include <stdio.h> 
#include "binary_search.h"

const int *binary_search(int value, const int *arr, size_t length) {
    size_t low = 0;
    size_t high = length;
    while(low <= high) {
        int mid = low + (high - low) / 2;

        if (arr[mid] == value) {
            //printf("%d", mid);
            const int * ret = &mid;
            return ret;
        }

        if (arr[mid] < value) low = mid +1;
        else high = mid -1;
    }
    return NULL;
}
