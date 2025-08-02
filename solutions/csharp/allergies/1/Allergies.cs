using System;
using System.Collections.Generic;

[Flags]
public enum Allergen
{
    Eggs = 1,
    Peanuts = 2,
    Shellfish = 4,
    Strawberries = 8,
    Tomatoes = 16,
    Chocolate = 32,
    Pollen = 64,
    Cats = 128
}

public class Allergies
{
    private Allergen _mask;
    public Allergies(int mask)
    {
        _mask = (Allergen)mask;
    }

    public bool IsAllergicTo(Allergen allergen)
    {
        return _mask.HasFlag(allergen);
    }

    public Allergen[] List()
    {
        var list = new List<Allergen>();
        foreach (var item in Enum.GetNames(typeof(Allergen)))
        {
            var flag = (Allergen)Enum.Parse(typeof(Allergen), item);
            if (_mask.HasFlag(flag)) {
                list.Add(flag);
            }
        }
        return list.ToArray();
    }
}