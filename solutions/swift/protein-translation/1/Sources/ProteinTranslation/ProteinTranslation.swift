enum TranslationError : Error {
    case invalidCodon
}

func translationOfRNA(rna strand: String) throws -> [String] {
  var rna = strand
  var protein: [String] = []
  while !rna.isEmpty && protein.last != "STOP" {
    let codon = String(rna.prefix(3))
    rna = String(rna.dropFirst(3))
    let result = try {
      switch codon {
          case "AUG": return "Methionine"
          case "UUU", "UUC": return "Phenylalanine"
          case "UUA", "UUG": return "Leucine"
          case "UCU", "UCC", "UCA", "UCG": return "Serine"
          case "UAU", "UAC": return "Tyrosine"
          case "UGU", "UGC": return "Cysteine"
          case "UGG": return "Tryptophan"
          case "UAA", "UAG", "UGA": return "STOP"
          default: throw TranslationError.invalidCodon
      }
    }()
    
    if result == "STOP" {
      break
    }
    protein.append(result)
  }
  return protein
}
