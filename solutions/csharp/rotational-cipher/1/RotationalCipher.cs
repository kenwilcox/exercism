using System;

public static class RotationalCipher
{
    const int a = (int)'a';
    const int A = (int)'A';
    const int z = (int)'z';
    const int Z = (int)'Z';

    public static string Rotate(string input, int shiftKey)
    {
        var ret = "";
        foreach (var c in input)
        {
            var number = (int)c;
            if (number >= a && number <= z)
            {
                number = HandleWrap(number, shiftKey, a, z);
            }
            else if (number >= A && number <= Z)
            {
                number = HandleWrap(number, shiftKey, A, Z);
            }
            ret += (char)number;
        }
        return ret;
    }

    static int HandleWrap(int number, int shiftKey, int min, int max)
    {
        if (number + shiftKey > max)
        {
            var difference = Math.Abs(max - (number + shiftKey));
            number = min - 1 + difference;
        }
        else
        {
            number += shiftKey;
        }
        return number;
    }
}