class Grains {
    class func square(_ number: Int) throws -> UInt64 {
        if (number < 1) {
            throw GrainsError.inputTooLow("Input[\(number)] invalid. Input should be between 1 and 64 (inclusive)")
        }
        if (number > 64) {
            throw GrainsError.inputTooHigh("Input[\(number)] invalid. Input should be between 1 and 64 (inclusive)")
        }
        
        return  UInt64(1) << (number-1)
    }
    
    class var total: UInt64 {
        var result: UInt64 = 0
        for i in 1...64 {
            result += try! square(i)
        }
        return result
    }
    
    enum GrainsError: Error {
        case inputTooHigh(_ message: String)
        case inputTooLow(_ message: String)
    }
}
