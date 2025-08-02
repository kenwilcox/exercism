import java.util.Map;
import java.util.stream.Collectors;

class ParallelLetterFrequency {
    private final Map<Character, Integer> letterCounts;
    
    ParallelLetterFrequency(String[] texts) {
        this.letterCounts = String.join(" ", texts)
            .chars()
            .parallel()
            .mapToObj(c -> (char)c)
            .filter(Character::isLetter)
            .collect(Collectors.groupingBy(Character::toLowerCase, Collectors.summingInt(c -> 1)));
    }

    Map<Character, Integer> countLetters() {
        return letterCounts;
    }

}
