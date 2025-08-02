module ProteinTranslation

let proteinMap = Map[
    ("AUG", "Methionine"); 
    ("UUU", "Phenylalanine"); ("UUC", "Phenylalanine");
    ("UUA", "Leucine"); ("UUG", "Leucine");
    ("UCU", "Serine"); ("UCC", "Serine"); ("UCA", "Serine"); ("UCG", "Serine");
    ("UAU", "Tyrosine"); ("UAC", "Tyrosine"); 
    ("UGU", "Cysteine"); ("UGC", "Cysteine"); 
    ("UGG", "Tryptophan"); 
    ("UAA", "STOP"); ("UAG", "STOP"); ("UGA", "STOP")
    ]

let proteins rna = 
    let list = new List<string>()
    let mutable skip = 0
    let take = 3
    let mutable Break = false
    while(skip + take <= rna.Length || not Break) do
        let protein = string.Concat(rna.Skip(skip).Take(take))
        let translate = proteinMap[protein]
        if translate == "STOP" then
            Break <- true
        list.Add(translate)
        skip += take
    list.ToArray()