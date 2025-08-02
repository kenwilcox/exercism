using System;
using System.Text;
using System.Collections.Generic;

public static class FoodChain
{
    public static string Recite(int verseNumber)
    {
        if (_verses.Count == 0) BuildVerses();
        return _verses[verseNumber].TrimEnd('\n');
    }

    public static string Recite(int startVerse, int endVerse)
    {
        var ret = new StringBuilder();
        if (_verses.Count == 0) BuildVerses();
        for (var i = startVerse; i <= endVerse; i++)
        {
            ret.Add(Recite(i) + Environment.NewLine);
        }
        return ret.ToString().Trim();
    }
    
    // This is so little data, just build the whole thing.
    private static Dictionary<int, string> _verses = new();
    private static void BuildVerses()
    {
        int max = creatures.Length;
        for (int i = 0; i < max; i++)
        {
            var ret = new StringBuilder();
            ret.Add(String.Format("I know an old lady who swallowed a {0}.", creatures[i]));
            ret.Add(comments[i]);
            
            for (int j = i; j > 0 && i < max - 1; j--)
            {
                var first = creatures[j];
                var second = creatures[j - 1];
                var output = String.Format(reason, first, second);
                if (second == "spider") output = output.TrimEnd('.') + " that wriggled and jiggled and tickled inside her.";
    
                ret.Add(output);
                if (j == 1)
                {
                    ret.Add(comments[j - 1]);
                }
            }
            _verses.Add(i + 1, ret.ToString());
        }
    }
    private const string reason = "She swallowed the {0} to catch the {1}.";
    private static readonly string[] creatures = { "fly", "spider", "bird", "cat", "dog", "goat", "cow", "horse" };
    private static readonly string[] comments =
    {
        "I don't know why she swallowed the fly. Perhaps she'll die.\n",
        "It wriggled and jiggled and tickled inside her.",
        "How absurd to swallow a bird!",
        "Imagine that, to swallow a cat!",
        "What a hog, to swallow a dog!",
        "Just opened her throat and swallowed a goat!",
        "I don't know how she swallowed a cow!",
        "She's dead, of course!"
    };    
}

public static class StringBuilderExt
{
    public static void Add(this StringBuilder t, string s)
    {
        t.Append(s + Environment.NewLine);
    }
}