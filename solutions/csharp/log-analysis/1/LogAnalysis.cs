using System;
using System.Linq;

public static class LogAnalysis 
{
    public static string SubstringAfter(this string s, string val) => s.Split(val).Last();

    public static string SubstringBetween(this string s, string start, string end) => s.Split(end).First().Split(start).Last();
    
    public static string Message(this string s) => s.SubstringAfter(": ");

    public static string LogLevel(this string s) => s.SubstringBetween("[", "]");
}