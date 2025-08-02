//Solution goes in Sources

class Squares {
    let max: Int
    
    init(_ max: Int) {
        self.max = max
    }
    
    var squareOfSum: Int {
        var sum = 0
        for i in 1...max {
            sum += i
        }
        return sum * sum
    }
    
    var sumOfSquares: Int {
        var sum = 0
        for i in 1...max {
            sum += i * i
        }
        return sum
    }
    
    var differenceOfSquares: Int {
        squareOfSum - sumOfSquares
    }
}
