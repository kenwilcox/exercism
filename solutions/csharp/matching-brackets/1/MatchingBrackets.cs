using System;
using System.Collections.Generic;

public static class MatchingBrackets
{
    public static bool IsPaired(string input)
    {
        var pairs = new Dictionary<string, string>
        {
            {"(", ")"},
            {"[", "]"},
            {"{", "}"},
        };
        var stack = new Stack<string>();

        foreach(var c in input)
        {
            var s = c.ToString();
            if ("{[(".Contains(s))
            {
                stack.Push(s);
            } 
            else if ("}])".Contains(s))
            {
                if (stack.Count == 0) return false;
                var p = pairs[stack.Pop()];
                if (s != p) return false;
            }
        }

        return stack.Count == 0;
    }
}
