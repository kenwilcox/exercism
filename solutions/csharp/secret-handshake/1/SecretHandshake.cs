using System;
using System.Collections.Generic;

public static class SecretHandshake
{
    private static Dictionary<CommandTypes, string> _commands = new Dictionary<CommandTypes, string>() {
        {CommandTypes.Wink, "wink"},
        {CommandTypes.DoubleBlink, "double blink"},
        {CommandTypes.CloseYourEyes, "close your eyes"},
        {CommandTypes.Jump, "jump"},
        {CommandTypes.Reverse, "reverse"}
    };

    [Flags]
    private enum CommandTypes 
    {
        Wink = 1,
        DoubleBlink = 2,
        CloseYourEyes = 4,
        Jump = 8,
        Reverse = 16
    }

    public static string[] Commands(int commandValue)
    {
        var ret = new List<string>();
        var reverse = false;
        var mask = (CommandTypes)commandValue;

        foreach(var item in Enum.GetNames(typeof(CommandTypes)))
        {
            var flag = (CommandTypes)Enum.Parse(typeof(CommandTypes), item);
            if(mask.HasFlag(flag)) 
            {
                if (flag == CommandTypes.Reverse) reverse = true;
                else ret.Add(_commands[flag]);
            }
        }

        if (reverse) ret.Reverse();
        return ret.ToArray();
    }
}
