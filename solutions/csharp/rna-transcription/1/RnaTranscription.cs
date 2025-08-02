public static class RnaTranscription
{
    public static string ToRna(string nucleotide)
    {
        var ret = "";
        foreach(var c in nucleotide)
        {
            switch (c) {
                case 'G': ret += "C"; break;
                case 'C': ret += "G"; break;
                case 'T': ret += "A"; break;
                case 'A': ret += "U"; break;
            }
        }
        return ret;
    }
}