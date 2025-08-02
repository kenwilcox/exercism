using System;
using System.Collections.Generic;

public static class SumOfMultiples
{
    public static int Sum(IEnumerable<int> multiples, int max)
    {
        // I don't get what this is asking for...
        var sum = 0;
        foreach(var number in multiples)
        {
            if (number > max) continue;
            sum += number;
        }
        return sum;
    }
}