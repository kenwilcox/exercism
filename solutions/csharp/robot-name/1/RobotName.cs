using System;
using System.Collections.Generic;
using System.Linq;

public class Robot
{
    private string _name;
    private static int _sequence;
    private static HashSet<string> _names = new HashSet<string>();

    public string Name
    {
        get
        {
            if (string.IsNullOrWhiteSpace(_name)) 
            {
                Reset();
            }
            return _name;
        }
    }

    public void Reset()
    {
        _sequence++;
        if (_sequence > 999) _sequence = 0;
        _name = RandomString(2) + _sequence.ToString("D3");        
        if (!_names.Add(_name)) Reset();
    }

    private static Random random = new Random();
    public static string RandomString(int length)
    {
        const string chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
        return new string(Enumerable.Repeat(chars, length)
        .Select(s => s[random.Next(s.Length)]).ToArray());
    }
}