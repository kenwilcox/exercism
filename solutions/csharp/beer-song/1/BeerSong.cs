public static class BeerSong
{

    public static string Recite(int startBottles, int takeDown)
    {
        var ret = "";
        for (int i = startBottles; i > startBottles - takeDown; i--)
        {
            if (i == 0)
            {
                ret += "No more bottles of beer on the wall, no more bottles of beer.\n";
                ret += "Go to the store and buy some more, 99 bottles of beer on the wall.";
                break;
            }
            if (i == 1)
            {
                ret += "1 bottle of beer on the wall, 1 bottle of beer.\n";
                ret += "Take it down and pass it around, no more bottles of beer on the wall.\n";
                ret += "\n";
            }
            else
            {
                ret += $"{i} bottles of beer on the wall, {i} bottles of beer.\n";
                ret += $"Take one down and pass it around, {i - 1} bottle{(i - 1 != 1 ? "s" : "")} of beer on the wall.\n";
                ret += "\n";
            }
        }
        return ret.Trim();
    }
}