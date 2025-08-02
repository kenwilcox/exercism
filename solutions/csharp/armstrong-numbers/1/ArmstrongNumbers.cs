using System;
using System.Linq;

public static class ArmstrongNumbers
{
    public static bool IsArmstrongNumber(int number)
    {
        if (number == 0) return true;
        var str = number.ToString();
        var sum = str.Sum(c => Math.Pow(double.Parse(c.ToString()), str.Length));
        return (int)sum == number;
    }
}