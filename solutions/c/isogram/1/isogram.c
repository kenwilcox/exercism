#include <string.h>
#include <ctype.h>
#include "isogram.h"

bool ignore(char c);

bool is_isogram(const char phrase[]) {
    if (phrase == NULL) return false;
    
    size_t len = strlen(phrase), i = 0, j = 0;
    for (i = 0; i + 1 < len; i++) {
        
        if (ignore(phrase[i])) continue;
        
        for (j = i + 1; j < len; j++) {
            if (ignore(phrase[j])) continue;
            
             if (tolower(phrase[i]) == tolower(phrase[j])) {
                return false;
             }
        }
    }
    return true;
}

bool ignore(char c) {
    if (c == ' ' || c == '-') return true;
    return false;
}