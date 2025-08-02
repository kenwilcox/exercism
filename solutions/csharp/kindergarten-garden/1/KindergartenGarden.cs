using System;
using System.Collections.Generic;

public enum Plant
{
    Violets,
    Radishes,
    Clover,
    Grass
}

public class KindergartenGarden
{
    private string[] _garden;
    private char[] _key = { 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l' };
    public KindergartenGarden(string diagram)
    {
        _garden = diagram.Split("\n");
    }

    private Plant GetPlant(char value)
    {
        switch (value)
        {
            case 'V': return Plant.Violets;
            case 'R': return Plant.Radishes;
            case 'C': return Plant.Clover;
            case 'G': return Plant.Grass;
        }
        throw new Exception("I don't know of this plant");
    }
    public IEnumerable<Plant> Plants(string student)
    {
        var ret = new List<Plant>();
        var studentIndex = Array.IndexOf(_key, student.ToLower()[0]) * 2;

        ret.Add(GetPlant(_garden[0][studentIndex]));
        ret.Add(GetPlant(_garden[0][studentIndex + 1]));
        ret.Add(GetPlant(_garden[1][studentIndex]));
        ret.Add(GetPlant(_garden[1][studentIndex + 1]));

        return ret;
    }
}