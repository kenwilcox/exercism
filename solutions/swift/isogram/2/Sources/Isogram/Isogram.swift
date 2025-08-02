//Solution goes in Sources

class Isogram {
    // Shamlessly borrowed from lonesometraveler
    // I did however use the named tuple (.inserted)
    // and not (.0) to make it more clear
    static func isIsogram(_ input: String) -> Bool {
        var set = Set<Character>()
        for letter in input.lowercased().filter({ $0.isLetter }) {
            if set.insert(letter).inserted == false {
                return false
            }
        }
        return true
    }
}
