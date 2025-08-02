using System;

public static class PhoneNumber
{
    public static (bool IsNewYork, bool IsFake, string LocalNumber) Analyze(string phoneNumber)
    {
        var parts = phoneNumber.Split('-');
        var isNewYork = parts[0] == "212";
        var isFake = parts[1] == "555";
        var localNumber = parts[2];
        return (isNewYork, isFake, localNumber);
    }

    public static bool IsFake((bool IsNewYork, bool IsFake, string LocalNumber) phoneNumberInfo)
    {        
        return phoneNumberInfo.IsFake;
    }
}
