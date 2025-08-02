//Solution goes in Sources
import Foundation

struct Robot {
    private static var counter:Int = 0
    private var _name: String = ""
    
    init() {
        _name = randomName(length: 2)
    }
    
    private func randomName(length: Int) -> String {
        let letters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
        Robot.counter += 1
        if Robot.counter < 999 {Robot.counter = 0}
        return String((0..<length).map{ _ in letters.randomElement()! }) +
            String(format: "%03d", Robot.counter)
    }
    
    var name: String {
        _name
    }
    
    mutating func resetName() {
       _name = randomName(length: 2)
    }
}
