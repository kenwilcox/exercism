//Solution goes in Sources

class ListOps {
    //ListOps.append([Int](), []
    static func append<T>(_ array:[T], _ values: [T]...) -> [T] {
        var ret = array
        for items in values {
            for item in items {
                ret.append(item)
            }
        }
        return ret
    }
    
    // ListOps.concat([Int]()), []
    static func concat<T>(_ array:[T], _ values: [T]...) -> [T] {
        var ret = array
        for items in values {
            for item in items {
                ret.append(item)
            }
        }
        return ret
    }
    
    // ListOps.filter([]) { $0 % 2 == 1 }
    static func filter<T>(_ array: [T], fn:(T) -> Bool) -> [T] {
        var ret = [T]()
        for item in array {
            if (fn(item)) {
                ret.append(item)
            }
        }
        return ret
    }

    
    // ListOps.length([])
    static func length<T>(_ array:[T]) -> Int {
        var ret = 0
        for _ in array {
            ret += 1
        }
        return ret
    }
    
    // ListOps.map([]) { $0 + 1 }
    static func map<T>(_ array: [T], fn:(T) -> T) -> [T] {
        var ret = [T]()
        for item in array {
            ret.append(fn(item))
        }
        return ret
    }
    
    // ListOps.foldLeft([], accumulated: 2, combine: +)
    static func foldLeft(_ array: [Int], accumulated:Int, combine: (Int, Int) -> Int) -> Int {
        // I don't understand how this works
        var ret = accumulated
        for item in array {
            ret += combine(0, item)
        }
        return ret
    }
    
    // ListOps.foldRight([], accumulated: 2, combine: *)
    static func foldRight<T>(_ array: [T], accumulated:T, combine: (T, T) -> T) -> T {
        var ret = accumulated
        return ret
    }
    
    // ListOps.reverse([Int]())
    static func reverse<T>(_ array: [T]) -> [T] {
        //if array.count == 0 {return array}
        var ret = [T]()
        for index in stride(from: array.count, to: 0, by: -1) {
            ret.append(array[index - 1])
        }
        return ret
    }
}
