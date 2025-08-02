using System;
using System.Linq;

public class PhoneNumber
{
    //private static Regex digits = new Regex(@"\d");
    public static string Clean(string phoneNumber)
    {
        var digits = string.Concat(phoneNumber.Where(char.IsDigit));
        if (digits.Length < 10) throw new ArgumentException("too short");        
        if (digits.Length == 11) {
          if (digits[0] != '1')  throw new ArgumentException("country code needs to be 1");
          digits = digits.Substring(1);
        } 
        if (digits.Length > 11) throw new ArgumentException("too long");
        if (digits[0] == '0' || digits[0] == '1') throw new ArgumentException("invalid area code");
        if (digits[3] == '0' || digits[3] == '1') throw new ArgumentException("invalid exchange code");
        return digits;
    }
}