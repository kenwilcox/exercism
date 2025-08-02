using System;
using System.Collections.Generic;
using System.Linq;

public class DndCharacter
{
    public int Strength { get; private set; }
    public int Dexterity { get; private set; }
    public int Constitution { get; private set; }
    public int Intelligence { get; private set; }
    public int Wisdom { get; private set; }
    public int Charisma { get; private set; }
    public int Hitpoints { get; private set; }

    public static int Modifier(int score)
    {
        return (int)Math.Floor((score-10)/2.0);
    }

    private static Random _rand = new Random();

    public static int Ability() 
    {
        return Enumerable.Range(1, 4)
            .Select(_ => _rand.Next(1,7))
            .OrderByDescending(x => x)
            .Take(3)
            .Sum();
    }

    public static DndCharacter Generate()
    {
        var constitution = Ability();
        var constitutionMod = Modifier(constitution);
        
        return new DndCharacter() {
            Strength = Ability(),
            Dexterity = Ability(),
            Constitution = constitution,
            Intelligence = Ability(),
            Wisdom = Ability(),
            Charisma = Ability(),
            Hitpoints = 10 + constitutionMod
        };
    }
}
