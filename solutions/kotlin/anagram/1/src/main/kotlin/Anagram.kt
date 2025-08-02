class Anagram(val source: String) {
    fun normalized(input: String): String {
        return input
                .toLowerCase()
                .toList()
                .sorted()
                .joinToString(separator = "")
    }

    fun match(anagrams: Collection<String>): Set<String> {
        return anagrams.filter { 
            source.toLowerCase() != it.toLowerCase() && normalized(source) == normalized(it) 
        }.toSet()
    }
}
