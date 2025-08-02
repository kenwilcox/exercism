using System;
using System.Collections.Generic;

public static class Etl
{
    public static Dictionary<string, int> Transform(Dictionary<int, string[]> old)
    {
        var ret = new Dictionary<string, int>();
        foreach(var kvp in old) {
            foreach(var v in kvp.Value) {
                ret[v.ToLower()] = kvp.Key;
            }
        }
        return ret;
    }
}