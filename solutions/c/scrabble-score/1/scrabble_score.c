#include <ctype.h>
#include <stdio.h>
#include "scrabble_score.h"

unsigned int score(const char *word) {
    int points[26] = { 1, 3, 3, 2, 1, 4, 2, 4, 1, 8, 5, 1, 3, 1, 1, 3, 10, 1, 1, 1, 1, 4, 4, 8, 4, 10 };
    int sum = 0;

    while (*word) {
        int idx = tolower(*word++) - 97;
        sum += points[idx];
    }
    return sum;
}