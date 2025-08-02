class Hamming {
    class func compute(_ firstStrand: String, against secondStrand: String) -> Int? {
        if firstStrand.count != secondStrand.count { return nil }
        return zip(firstStrand,secondStrand).filter{$0 != $1}.count
    }
}
