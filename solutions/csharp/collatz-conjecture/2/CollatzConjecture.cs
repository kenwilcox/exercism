using System;

public static class CollatzConjecture
{
    public static int Steps(int number)
    {
        if (number < 1) throw new ArgumentOutOfRangeException("I can't do that Dave.");
        var counter = 0;
        while (number > 1)
        {
            counter++;
            if (number % 2 == 0) number /= 2;
            else number = (number * 3) + 1;
        }
        return counter;
    }
}