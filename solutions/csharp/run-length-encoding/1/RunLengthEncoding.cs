using System;
using System.Linq;

public static class RunLengthEncoding
{
    public static string Encode(string input)
    {
        if (string.IsNullOrEmpty(input)) return "";
        var first = input.First();
        var parts = input.TakeWhile(x => x == first).ToList();
        if (parts.Count == 1) return $"{first}" + Encode(input.Substring(parts.Count));
        return $"{parts.Count}{first}" + Encode(input.Substring(parts.Count));
    }
    
    public static string Decode(string input)
    {
        if (string.IsNullOrEmpty(input)) return "";
        var digits = input.TakeWhile(x => Char.IsDigit(x)).ToList();
        if (digits.Any())
        {
            var count = int.Parse(string.Join("", digits));
            var rest = input.Substring(digits.Count());
            var letter = rest.First();
            var decode = string.Join("", Enumerable.Repeat(letter, count));
            return decode + Decode(rest.SafeSubstring(1));
        } 
        else 
        {
            var first = input.First().ToString();
            return first + Decode(input.SafeSubstring(1));
        }
    }
    
    public static string SafeSubstring(this string str, int startIndex)
    {
        if (str.Length > startIndex) return str.Substring(startIndex);
        return "";
    }
}
