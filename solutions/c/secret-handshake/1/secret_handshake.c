#include <stdlib.h>
#include <stdbool.h>
#include "secret_handshake.h"

/*
00001 = wink
00010 = double blink
00100 = close your eyes
01000 = jump

10000 = Reverse the order of the operations in the secret handshake.
*/

bool isBitSet(int flags, int bit);

const char **commands(size_t number) {
    const char ** result = malloc(10 * sizeof(char*));
    int counter = 0;
    
    result[0] = NULL;

    if (isBitSet(number, 1)) {
        result[counter] = "wink";
        counter++;
    }
    
    if (isBitSet(number, 2)) {
        result[counter] = "double blink";
        counter++;
    }

    if (isBitSet(number, 4)) {
        result[counter] = "close your eyes";
        counter++;
    }

    if (isBitSet(number, 8)) {
        result[counter] = "jump";
        counter++;
    }
    
    // reverse it
    if (isBitSet(number, 16)) {
        if (counter > 1) {
            for(int i = 0; i < counter/2; i++) {
                const char* temp = result[i];
                result[i] = result[counter -1 -i];
                result[counter -1 -i] = temp;
            }
        }
    }

    return result;
}

bool isBitSet(int flags, int bit) {
    return (flags & bit) == bit;
}