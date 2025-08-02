class RotationalCipher(val rot: Int) {
    fun encode(text: String): String = text.map {it.rot()}.joinToString("")

    private fun Char.rot() = if (!isLetter()) this else {
        val base = if (isUpperCase()) 'A' else 'a'
        base + (this - base + rot) % 26
    }
}
