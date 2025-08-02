#include <string.h>
#include "hamming.h"

int compute(const char *lhs, const char *rhs) {
    size_t len = strlen(lhs);
    int count = 0;
    if (len != strlen(rhs)) return -1;
    for (size_t i = 0; i < len; i++) {
        if (lhs[i] != rhs[i]) count++;
    }
    return count;
}