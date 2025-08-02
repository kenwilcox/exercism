//Solution goes in Sources

class SumOfMultiples {
    class func toLimit(_ max: Int, inMultiples items: [Int]) -> Int {
        var set: Set<Int> = []
        for i in 0..<max {
            for j in items.filter({ $0 != 0 }) {
                if i % j == 0 {
                    set.insert(i)
                }
            }
        }
        return set.reduce(0, +)
    }
}
