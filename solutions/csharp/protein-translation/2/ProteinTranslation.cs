using System;
using System.Linq;
using System.Collections.Generic;

public static class ProteinTranslation
{
    private static readonly Dictionary<string, string> Protiens = new Dictionary<string, string>()
    {
        {"AUG", "Methionine"},
        {"UUU", "Phenylalanine"}, {"UUC", "Phenylalanine"},
        {"UUA", "Leucine"},{"UUG", "Leucine"},
        {"UCU", "Serine"},{"UCC", "Serine"},{"UCA", "Serine"},{"UCG", "Serine"},
        {"UAU", "Tyrosine"},{"UAC", "Tyrosine"},
        {"UGU", "Cysteine"},{"UGC", "Cysteine"},
        {"UGG", "Tryptophan"},
        {"UAA", "STOP"},{"UAG", "STOP"},{"UGA", "STOP"}
    };

    public static string[] Proteins(string strand)
    {
        var list = new List<string>();
        var skip = 0;
        const int take = 3;
        while (skip + take <= strand.Length)
        {
            var protien = string.Concat(strand.Skip(skip).Take(take));
            var translate = Protiens[protien];
            if (translate == "STOP") break;
            list.Add(translate);
            skip += take;
        }
        return list.ToArray();
    }
}