class AllYourBase {
  static rebase(inputBase, digits, outputBase) {
    if(inputBase < 2) {Fiber.abort("input base must be >= 2")}
    if(outputBase < 2) {Fiber.abort("output base must be >= 2")}
    if(digits.any {|x| x < 0 || x >= inputBase}) {
      Fiber.abort("all digits must satisfy 0 <= d < input base")
    }
    var working = digits.reduce(0) {|total, x| (total * inputBase) + x}
    var result = []
    while(working != 0) {
      result.insert(0, working % outputBase)
      working = (working / outputBase).floor
    }
    return result.isEmpty ? [0] : result
  }
}
