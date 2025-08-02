//Solution goes in Sources

class DNA {
    var _counts = [String: Int]()
    
    init?(strand: String) {
        _counts["A"] = 0
        _counts["C"] = 0
        _counts["G"] = 0
        _counts["T"] = 0
        
        for char in strand {
            if let val = _counts["\(char)"] {
                _counts["\(char)"] = val + 1
            } else {return nil}
        }
    }
    
    func count(_ nucleotide: String) -> Int {
        return _counts[nucleotide] ?? 0
    }
    
    func counts() -> [String:Int] {
        return _counts
    }
}
