using System;
using System.Linq;
using System.Collections.Generic;

public enum Classification
{
    Perfect,
    Abundant,
    Deficient
}

public static class PerfectNumbers
{
    public static Classification Classify(int number)
    {
        if (number < 1) throw new ArgumentOutOfRangeException("Invalid number");
        var value = GetFactors(number).Where(x => x != number).Sum(x => x);
        if (value == number) return Classification.Perfect;
        return value > number ? Classification.Abundant : Classification.Deficient;
    }

    private static IEnumerable<int> GetFactors(int x)
    {
        for (int i = 1; i * i <= x; i++)
        {
            if (0 != (x % i)) continue;

            yield return i;
            if (i != (x / i))
            {
                yield return x / i;
            }
        }
    }
}
