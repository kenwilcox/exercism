using System;
using System.Collections.Generic;
using System.Globalization;
public static class ReverseString
{
    // This should handle strings with accents, etc.
    public static string Reverse(string input)
    {
        var enumerator = StringInfo.GetTextElementEnumerator(input);
        var elements = new List<string>();
        while(enumerator.MoveNext()) {
            elements.Add(enumerator.GetTextElement());
        }
        elements.Reverse();
        return string.Concat(elements);
    }
}