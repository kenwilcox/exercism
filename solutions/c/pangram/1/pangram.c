#include <stdio.h>
#include <ctype.h>
#include "pangram.h"

bool is_pangram(const char *sentence) {
    if (sentence == NULL) return false;

    size_t count = 0;
    for ( size_t i = 0; sentence[i] != '\0'; i++ )
    {
        if (isalpha((unsigned char) sentence[i]))
        {
            char c = tolower((unsigned char)sentence[i]);
            
            size_t j = 0;
            while ( j != i && c != tolower((unsigned char)sentence[j])) ++j;
            
            if ( j == i ) ++count;
        }
    }
    return count == 26;
}