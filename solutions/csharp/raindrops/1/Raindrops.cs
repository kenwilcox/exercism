public static class Raindrops
{
    public static string Convert(int number)
    {
        var ret = "";
        if (number % 3 == 0) { ret += "Pling"; }
        if (number % 5 == 0) { ret += "Plang"; }
        if (number % 7 == 0) { ret += "Plong"; }
        if (ret.Length == 0) { ret = $"{number}"; }
        return ret;
    }
}