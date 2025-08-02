using System;
using System.Linq;

static class LogLine
{
    public static string Message(string logLine)
    {
        return logLine.Split(':').Last().Trim();
    }

    public static string LogLevel(string logLine)
    {
        return logLine.Split('[').Last().Split(']').First().ToLower();
    }

    public static string Reformat(string logLine)
    {
        return $"{Message(logLine)} ({LogLevel(logLine)})";
    }
}
