using System;
using System.Collections.Generic;
using System.Linq;

public static class ParallelLetterFrequency
{
    public static Dictionary<char, int> Calculate(IEnumerable<string> texts)
    {
        return texts
            .AsParallel()
            .SelectMany(text => text.ToLower().Select(c => c))
            .Where(c => char.IsLetter(c))
            .GroupBy(x => x)
            .ToDictionary(d => d.Key, d => d.Count());
    }
}