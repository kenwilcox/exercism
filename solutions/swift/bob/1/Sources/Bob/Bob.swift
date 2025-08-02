import Foundation

class Bob {
    class func hey(_ remark: String) -> String {
        let message = remark.trimmingCharacters(in: .whitespaces)
        let noWords = message.uppercased() == message.lowercased()
        
        if message.count == 0 {
            return "Fine. Be that way!"
        }
        if !noWords && message.uppercased() == message {
            return "Whoa, chill out!"
        }
        if message.hasSuffix("?") {
            return "Sure."
        }
        return "Whatever."
    }
}
