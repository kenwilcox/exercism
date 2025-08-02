using System.Linq;
using System.Collections.Generic;

public static class SumOfMultiples
{
    public static int Sum(IEnumerable<int> multiples, int max)
    {
        return Enumerable.Range(0, max)
            .Where(x => multiples.Where(y => y != 0)
            .Any(y => x % y == 0))
            .Sum();
    }
}