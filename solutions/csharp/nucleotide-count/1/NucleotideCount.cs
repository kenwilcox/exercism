using System;
using System.Collections.Generic;

public static class NucleotideCount
{
    public static IDictionary<char, int> Count(string sequence)
    {
        var ret = new Dictionary<char, int>() {
            {'A', 0},
            {'C', 0},
            {'G', 0},
            {'T', 0},
        };

        foreach(var c in sequence)
        {
            if (ret.ContainsKey(c)) 
            {
                ret[c] += 1;
            } 
            else 
            {
                throw new ArgumentException("Invalid sequence");
            }
        }
        return ret;
    }
}