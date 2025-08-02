#include <math.h>
#include <stdbool.h>
#include "sieve.h"

uint32_t sieve(uint32_t limit, uint32_t *primes, size_t max_primes) {

    //uint32_t i, j;
    bool buff[max_primes];// = new bool[max_primes];
    for (uint32_t i = 2; i < max_primes; i++)
    {
        buff[i] = true;//set all numbers to true
    }

    //weed out the non primes by finding mutiples 
    for (size_t j = 2; j < max_primes; j++)
    {
        if (buff[j])//is true
        {
        for (long p = 2; (p * j) < max_primes; p++)
        {
            buff[p * j] = false;
        }
        }
    }
    
    // fill primes[] with prime up to limit
    int sum = 0;
    for(size_t i = 0; i < max_primes; i++)
    {
        if (buff[i]) {
            primes[sum] = i;
            sum++;      
        }
        if(i >= limit) break;
    }
    
    return sum;
}