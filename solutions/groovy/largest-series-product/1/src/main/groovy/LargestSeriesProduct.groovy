class LargestSeriesProduct {
    static largestProduct(digits, span) {
        if (span == 0) return 1
        if (span < 0) throw new IllegalArgumentException("span must not be negative")
        if (digits.size() < span) throw new IllegalArgumentException("span must be smaller than string length")
        if (digits.toCharArray().any {!Character.isDigit(it)}) throw new IllegalArgumentException("digits input must only contain digits")
        return digits.toCharArray()
            .collect {Character.getNumericValue(it)}
            .collate(span, 1, false)
            .collect {it.inject(1) {t, n -> t * n}}
            .max()
    }
}
