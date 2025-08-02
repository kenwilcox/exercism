using System;
using System.Linq;

public static class Pangram
{
    public static bool IsPangram(string input)
    {
        var chars = input.ToLowerInvariant().Select(x => Char.IsLetter(x)? x : '\0').ToHashSet();
		chars.Remove('\0');
		return chars.Count == 26;
    }
}
