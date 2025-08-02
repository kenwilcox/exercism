#include "armstrong_numbers.h"

int get_number_of_digits(int n);

bool is_armstrong_number(int candidate)
{
    int numberOfDigits = get_number_of_digits(candidate);
    int sum = 0;

    for (int i = candidate; i != 0; i /= 10)
    {
        int num = i % 10;
        int n = 1;
        for (int j = 0; j < numberOfDigits; j++)
        {
            n *= num;
        }
        sum += n;
    }

    return sum == candidate;
}

int get_number_of_digits(int n)
{
    int sum = 0;
    while (n != 0)
    {
        n /= 10;
        ++sum;
    }
    return sum;
}