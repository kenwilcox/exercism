using System.Collections.Generic;
using System.Linq;

public static class Dominoes
{
    public static bool CanChain(IEnumerable<(int, int)> dominoes)
    {
        var list = dominoes.ToList();
        if (list.Count == 0) return true;
        var chain = Connect(list).ToList();
        return chain.Count <= 1 && chain[0].A == chain[0].B;
    }
    
    private static List<(int A, int B)> Connect(List<(int A, int B)> dominoes)
    {
        if (dominoes.Count == 1) return dominoes;
        var chain = dominoes;

        var matches = dominoes.Skip(1).Where(x => x.A == dominoes.First().B || x.B == dominoes.First().B);
        foreach(var match in matches)
        {
            var links = dominoes.Skip(1).ToList();
            links.Remove(match);
            var head = (dominoes.First().A, dominoes.First().B == match.A ? match.B : match.A );
            chain = Connect(links.Prepend(head).ToList());
            if(chain is { Count: 1 }) return chain;
        }
        return chain;
    }
}