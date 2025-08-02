using System.Text.RegularExpressions;

public static class PigLatin
{
    private static readonly Regex Vowels = new(@"(?<begin>^|\s+)(?<vowel>a|e|i|o|u|yt|xr)(?<rest>\w+)", RegexOptions.Compiled);
    private const string VowelReplace = "${begin}${vowel}${rest}ay";
    
    private static readonly Regex Consonants = new(@"(?<begin>^|\s+)(?<consonant>ch|qu|thr|th|rh|sch|yt|\wqu|\w)(?<rest>\w+)", RegexOptions.Compiled);
    private const string ConsonantReplace = "${begin}${rest}${consonant}ay";
    
    public static string Translate(string word) =>
        Vowels.IsMatch(word)
            ? Vowels.Replace(word, VowelReplace)
            : Consonants.Replace(word, ConsonantReplace);
}