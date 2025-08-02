//Solution goes in Sources

class Raindrops {
    private var _number: Int
    
    init(_ number: Int) {
        _number = number
    }
    
    var sounds: String {
        get {
            var ret = ""
            if (_number % 3 == 0) {ret += "Pling"}
            if (_number % 5 == 0) {ret += "Plang"}
            if (_number % 7 == 0) {ret += "Plong"}
            if (ret.count == 0) {ret = "\(_number)"}
            return ret
        }
    }
    
}
