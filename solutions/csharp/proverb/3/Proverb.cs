using System;
using System.Collections.Generic;

public static class Proverb
{
    public static string[] Recite(string[] subjects)
    {
        var list = new List<string>();
        for (var i = 0; i < subjects.Length - 1; i++)
        {
            list.Add($"For want of a {subjects[i]} the {subjects[i + 1]} was lost.");
        }

        if (subjects.Length > 0)
        {
            list.Add($"And all for the want of a {subjects[0]}.");
        }
        return list.ToArray();
    }
}