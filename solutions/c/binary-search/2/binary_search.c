#include <math.h> 
#include "binary_search.h"

const int *binary_search(int value, const int *arr, size_t length) {
    int low = 0;
    int high = length -1;
    while(low <= high) {
        int mid = low + (high - low) / 2;
        
        if (arr[mid] == value) {
            return &arr[mid];
        }

        if (arr[mid] < value) low = mid +1;
        else high = mid -1;
    }
    return NULL;
}
