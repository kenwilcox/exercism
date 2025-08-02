//Solution goes in Sources
import Foundation

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
        return Int(pow(Double(sum), 2))
    }
    
    var sumOfSquares: Int {
        var sum = 0
        for i in 1...max {
            sum += Int(pow(Double(i), 2))
        }
        return sum
    }
    
    var differenceOfSquares: Int {
        squareOfSum - sumOfSquares
    }
}
