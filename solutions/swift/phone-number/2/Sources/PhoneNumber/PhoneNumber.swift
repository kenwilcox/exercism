class PhoneNumber {
  let digits: String

  init(_ phoneNumber: String) {
    digits = phoneNumber.filter({$0.isNumber})
  }

  func clean() throws -> String {
    var numbers = digits.compactMap{$0.wholeNumberValue}
    if numbers.first == 1 {
      numbers.removeFirst()
    }
    
    guard numbers.count == 10, numbers[0] > 1, numbers[3] > 1 else {
      throw PhoneNumberError.invalidPhoneNumber
    }
    return numbers.map{String($0)}.joined()
  }
}

enum PhoneNumberError: Error {
  case invalidPhoneNumber
}