class Hamming {
  static compute(first, second) {
    first.count == second.count || Fiber.abort("strands must be of equal length")
    return (0...first.count).count {|x| first[x] != second[x]}
  }
}
