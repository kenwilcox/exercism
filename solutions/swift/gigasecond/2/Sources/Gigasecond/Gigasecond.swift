//Solution goes in Sources
import Foundation

//Gigasecond(from: "2011-04-25T00:00:00")?.description
class Gigasecond {
    var date: Date
    var dateFormatter: DateFormatter
    
    init?(from isoDate: String) {
        dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        guard let optDate = dateFormatter.date(from:isoDate) else {return nil}
        date = optDate.addingTimeInterval(1_000_000_000)
    }
}

extension Gigasecond: CustomStringConvertible {
    var description: String {
        let ret = dateFormatter.string(from: date)
        return ret
    }
}
