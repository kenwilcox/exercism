object Series {
  def largestProduct(span: Int, digits: String): Option[Int] = {
    if (span > digits.length || span < 0) None
    else if (digits.map(_.asDigit).count(x => x < 10 && x >= 0) != digits.length) None
    else (span, digits) match {
      case (0, _) => Some(1)
      case (_, "") => None
      case (_, _) => Some(digits.map(_.asDigit).sliding(span).map(_.product).max)
    }
  }
}