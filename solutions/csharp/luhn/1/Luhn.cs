using System.Linq;
using System.Text.RegularExpressions;

public static class Luhn
{
    private static readonly Regex _regex = new(@"^(\d *){2,}$");
    
    public static bool IsValid(string number) => _regex.IsMatch(number) 
        && number
        .Replace(" ", "")
        .Reverse()
        .Select(Checksum)
        .Sum() % 10 == 0;
    
    public static int Checksum(char digit, int index) => index % 2 == 0 
        ? digit - '0' : (digit - '0') * 2 is var d && d > 9 
            ? d - 9 : d;
}