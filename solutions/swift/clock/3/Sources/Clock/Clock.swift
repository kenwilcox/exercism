//Solution goes in Sources
import Foundation

class Clock {
    var minutes: Int
    
    init(hours: Int, minutes: Int = 0) {
        let minsPerDay = 24 * 60
        self.minutes = ((hours * 60 + minutes) % minsPerDay + minsPerDay) % minsPerDay
    }
    
    func add(minutes: Int) -> Clock {
        Clock(hours: 0, minutes: self.minutes + minutes)
    }
    
    func subtract(minutes: Int) -> Clock {
        add(minutes: -minutes)
    }
    
}

extension Clock: Equatable {
    static func == (lhs: Clock, rhs: Clock) -> Bool {
        lhs.minutes == rhs.minutes
    }
}

extension Clock: CustomStringConvertible {
    var description: String {
        String(format: "%02d:%02d", minutes / 60, minutes % 60)
    }
}
