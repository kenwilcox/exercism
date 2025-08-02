//Solution goes in Sources

class RnaTranscription {
    enum TranscriptionError: Error {
        case invalidNucleotide(message: String)
    }
}

class Nucleotide {
    let rna: String
    let rnaToDna = ["G":"C", "C":"G", "T":"A", "A":"U"]
    
    init(_ rna: String) {
        self.rna = rna
    }
    
    func complementOfDNA() throws -> String {
        var ret = ""
        for char in rna {
            if let val = rnaToDna[String(char)] {
                ret += val
            } else {
                throw RnaTranscription.TranscriptionError.invalidNucleotide(message: "\(char) is not a valid Nucleotide")
            }
        }
        return ret
    }
}
