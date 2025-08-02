class PhoneNumber {
    val number: String

    constructor(number: String) {
        var digits = number.filter { it.isDigit() }

        when (digits.length) {
            10 -> {}
            11 -> {
                if (digits[0] != '1') {
                    throw IllegalArgumentException()
                } else {
                    digits = digits.drop(1)
                }
            }
            else -> throw IllegalArgumentException()
        }

        require (digits[0] !in "01")
        require (digits[3] !in "01")

        this.number = digits
    }
}
