class Diamond {
  static rows(letter) {
    var c = letter.bytes[0] - 65
    var line = (0..c).map{|x| " " * (c - x) + String.fromByte(x + 65) + " " * x }
      .map{|x| x + x[-1..0].skip(1).join()}.toList
      return line + line[-1..0].skip(1).toList
  }
}