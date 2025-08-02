using System;
using System.Linq;
using System.Collections.Generic;

public static class Isogram
{
    public static bool IsIsogram(string word)
    {
        var set = new HashSet<char>();
        foreach(var letter in word.ToLower().Where(x => Char.IsLetter(x)))
        {
            if (!set.Add(letter)) return false;
        }
        return true;
    }
}
