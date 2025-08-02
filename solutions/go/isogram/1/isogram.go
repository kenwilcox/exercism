package isogram

import (
	"strings"
)

// IsIsogram returns true if the word has non repeating characters
func IsIsogram(word string) bool {
	word = strings.ToUpper(word)
	m := make(map[string]int)
	for i := 0; i < len(word); i++ {
		c := string([]rune(word)[i])
		if c == "-" || c == " " {
			continue
		}
		m[c]++
	}

	// now that we have a map, check the values
	// I'm sure there is a better way to do this
	for _, v := range m {
		if v > 1 {
			return false
		}
	}
	return true
}