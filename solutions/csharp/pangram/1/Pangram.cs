using System;
using System.Linq;

public static class Pangram
{
    public static bool IsPangram(string input)
    {
        var alpha = "abcdefghijklmnopqrstuvwxyz".ToCharArray().ToList();
        var word = input.ToLower();
        foreach (var c in word)
        {
            alpha.Remove(c);
        }
        return !alpha.Any();
    }
}
