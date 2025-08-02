using System;
using System.Collections.Generic;

public static class Series
{
    public static string[] Slices(string numbers, int sliceLength)
    {
        if (sliceLength < 1) throw new ArgumentException("sliceLength cannot be less than 1");
        if (numbers.Length < sliceLength) throw new ArgumentException("sliceLength is less than number length");
        var ret = new List<string>();
        for(var i = 0; i <= numbers.Length - sliceLength; i++)
        {
            ret.Add(numbers.Substring(i, sliceLength));
        }
        return ret.ToArray();
    }
}