using System;

public static class ResistorColor
{
    enum ColorEnum {
        black = 0, brown, red, orange, yellow, 
        green, blue, violet, grey, white
    }

    public static int ColorCode(string color)
    {
        var val = Enum.Parse(typeof(ColorEnum), color);
        return (int)val;
    }

    public static string[] Colors()
    {
        return Enum.GetNames(typeof(ColorEnum));
    }
}