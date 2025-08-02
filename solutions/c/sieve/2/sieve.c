#include <math.h>
#include <stdbool.h>
#include "sieve.h"

uint32_t sieve(uint32_t limit, uint32_t *primes, size_t max_primes) {
    uint32_t i, j, k, count;
    bool range[limit + 1];
    
    for (i = 0 ; i <= limit ; i++) {
        range[i] = true;
    }

    for (i = 0 ; i < max_primes ; i++) {
        primes[i] = 0;
    }
    
    range[0] = false;
    range[1] = false;
    
    count = 0;
    
    for (i = 2 ; i <= limit ; i++) {
        if (range[i]) {
            primes[count] = i;
            k = 2;
            for (j = i * k ; j <= limit ; j = i * k) {
                range[j] = false;
                k++;
            }
            count++;
        }
        if (count == max_primes) return count;
    }
    return count;
}