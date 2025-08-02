//Solution goes in Sources

class ETL {
    static func transform(_ old:[Int:[String]]) -> [String:Int] {
        var ret = [String:Int]()
        for kvp in old {
            for v in kvp.value {
                ret[v.lowercased()] = kvp.key
            }
        }
        return ret
    }
}
