package letter

// FreqMap records the frequency of each rune in a given text.
type FreqMap map[rune]int

// Frequency counts the frequency of each rune in a given text and returns this
// data as a FreqMap.
func Frequency(s string) FreqMap {
	m := FreqMap{}
	for _, r := range s {
		m[r]++
	}
	return m
}

func ConcurrentFrequency(items []string) FreqMap {
	maps := make(chan FreqMap, len(items))
	ret := FreqMap{}

	for _, str := range items {
		go func(str string) {
			maps <- Frequency(str)
		}(str)
	}

	for range items {
		for letter, num := range <-maps {
			ret[letter] += num
		}
	}
	close(maps)
	return ret
}
