using System;
using System.Collections.Generic;

public static class Sieve
{
    public static int[] Primes(int limit)
    {
        if (limit < 2) throw new ArgumentOutOfRangeException();
        var isPrime = new bool[limit + 1];
        for (int i = 2; i <= limit; i++) isPrime[i] = true;

        // cross out multiples
        for (var i = 2; i <= limit; i++)
        {
            if (!isPrime[i]) continue;

            // knock out multiples of i.
            for(var j = i * 2; j <= limit; j+= i)
                isPrime[j] = false;
        }

        var ret = new List<int>();
        for(var i = 2; i <= limit; i++)
          if(isPrime[i]) ret.Add(i);
        return ret.ToArray();
    }
}