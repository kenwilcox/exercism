using System;
using System.Collections.Generic;

public static class Etl
{
    public static Dictionary<string, int> Transform(Dictionary<int, string[]> old)
    {
        var ret = new Dictionary<string, int>();
        foreach(var (key, value) in old) {
            foreach(var v in value) {
                ret[v.ToLower()] = key;
            }
        }
        return ret;
    }
}