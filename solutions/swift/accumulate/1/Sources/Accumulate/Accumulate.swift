//Solution goes in Sources

extension Collection {
    func accumulate<T>(_ input: (T) -> T) -> [T] {
        var ret = [T]()
        for item in self {
            ret.append(input(item as! T))
        }
        return ret
    }
    
    //Cannot convert value of type '(String) -> [String]' to expected argument type '(_) -> _'
}
