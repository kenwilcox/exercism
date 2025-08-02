//Solution goes in Sources

class Isogram {
    static func isIsogram(_ str: String) -> Bool {
        var counts = [Character:Int]()
        for c in str.uppercased() {
            if c == "-" || c == " " {continue}
            let value = counts[c] ?? 0
            counts[c] = value + 1
        }
        
        return counts.filter { $0.value > 1 }.count == 0
    }
}
