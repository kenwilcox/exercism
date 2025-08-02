//Solution goes in Sources

extension Collection {
    func accumulate<T>(_ input: (Element) -> T) -> [T] {
        var ret = [T]()
        for item in self {
            ret.append(input(item))
        }
        return ret
    }    
}
