//Solution goes in Sources

class Clock {
    var hours: Int
    var minutes: Int
    
    private func setHours(_ hours: Int) {
        self.hours = hours
        if self.hours < 0 {
            self.setHours(24 + self.hours)
        }
        if self.hours >= 24 {
            self.setHours(self.hours - 24)
        }
    }
    
    private func setMinutes(_ minutes: Int) {
        self.minutes = minutes
        if self.minutes < 0 {
            setMinutes(60 + self.minutes)
            setHours(self.hours - 1)
        }
        if self.minutes >= 60 {
            let h = self.minutes / 60
            setHours(self.hours + h)
            setMinutes(self.minutes % 60)
        }
    }
    
    init(hours: Int, minutes: Int = 0) {
        self.hours = hours
        self.minutes = minutes
        setHours(hours)
        setMinutes(minutes)
    }
    
    func add(minutes: Int) -> Clock {
        if minutes < 0 {
            return subtract(minutes: abs(minutes))
        }
        let hours = minutes / 60
        let minutes = minutes % 60
        setHours(self.hours + hours)
        setMinutes(self.minutes + minutes)
        return self
    }
    
    func subtract(minutes: Int) -> Clock {
        let hours = minutes / 60
        let minutes = minutes % 60
        setHours(self.hours - hours)
        setMinutes(self.minutes - minutes)
        return self
    }
    
}

extension Clock: Equatable {
    static func == (lhs: Clock, rhs: Clock) -> Bool {
        return lhs.minutes == rhs.minutes && lhs.hours == rhs.hours
    }
}

extension Clock: CustomStringConvertible {
    var description: String {
        // formatter?
        let hourStr = hours < 10 ? "0" + String(hours): String(hours)
        let minuteStr = minutes < 10 ? "0" + String(minutes): String(minutes)
        return "\(hourStr):\(minuteStr)"
    }
}
