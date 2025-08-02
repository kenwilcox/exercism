object RunLengthEncoding {

    fun encode(input: String): String {
        if (input.isEmpty()) return ""
        val first = input.first()
        val count = input.takeWhile { it == first }.count()

        return when {
            count > 1 -> "$count"
            else -> ""
        } + first + encode(input.substring(count))
    }

    fun decode(input: String): String {
        if (input.isEmpty()) return ""
        val digits = input.takeWhile { it.isDigit() }
        val tail = input.substring(digits.count())
        val repeated = tail.first().toString().repeat(digits.toIntOrNull() ?: 1)
        return repeated + decode(tail.substring(1))
    }
}
