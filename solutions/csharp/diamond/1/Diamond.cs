using System;
using System.Collections.Generic;
using System.Linq;

public static class Diamond
{
    public static string Make(char target)
    {
        var counts = GetLetterCounts(target);
        var diamondRows = counts.Concat(counts.Reverse().Skip(1));
        var rows = diamondRows.Select(letter => MakeRow(counts.Count(), letter));
        return string.Join("\n", rows);
    }

    private static IEnumerable<(char, int)> GetLetterCounts(char max) =>
        Enumerable.Range('A', max - 'A' + 1)
            .Select((c, i) => ((char)c, i));

    private static string MakeRow(int length, (char, int) letterRow)
    {
        var (letter, row) = letterRow;
        var outer = "".PadRight(length - row -1);
        var inner = "".PadRight(row == 0 ? 0: row * 2 -1);

        if (letter == 'A') return $"{outer}{letter}{outer}";
        return $"{outer}{letter}{inner}{letter}{outer}";
    }
}