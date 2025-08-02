#include <string.h>
#include <stdlib.h>
#include "reverse_string.h"

char *reverse(const char *value)
{
    int len = strlen(value) - 1;
    char* result = malloc(len + 1);

    result[len] = 0;

    if (len == 0)
    {
        return result;
    }

    int last = len;
    int it = 0;
    while (it <= last)
    {
        result[it] = value[last - it];
        ++it;
    }

    return result;
}