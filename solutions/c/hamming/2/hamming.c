#include <string.h>
#include "hamming.h"

int compute(const char *lhs, const char *rhs) {
    int distance = 0;
    for (; *lhs != '\0' && *rhs != '\0'; lhs++, rhs++)
    {
        if (*lhs != *rhs) distance++;
    }

    if (*lhs != '\0' || *rhs != '\0') return -1;
    return distance;
}