using System;

public static class Proverb
{
    public static string[] Recite(string[] subjects)
    {
        var ret = new string[subjects.Length];
        var counter = 0;
        if (subjects.Length >= 1)
        {
            for (var i = 0; i < subjects.Length - 1; i++)
            {
                var one = subjects[i];
                var two = subjects[i + 1];
                ret[counter] = $"For want of a {one} the {two} was lost.";
                counter++;
            }
            var first = subjects[0];
            ret[counter] = $"And all for the want of a {first}.";
        }

        return ret;
    }
}