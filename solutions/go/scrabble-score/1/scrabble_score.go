/*
Package scrabble implements a simple method to calculate the score of a word
*/
package scrabble

import "strings"

// Score returns the scrabble score for a word
func Score(input string) int {
	score := 0
	input = strings.ToUpper(input)
	for i := 0; i < len(input); i++ {
		switch string([]rune(input)[i]) {
		case "A", "E", "I", "O", "U", "L", "N", "R", "S", "T":
			score++
		case "D", "G":
			score += 2
		case "B", "C", "M", "P":
			score += 3
		case "F", "H", "V", "W", "Y":
			score += 4
		case "K":
			score += 5
		case "J", "X":
			score += 8
		case "Q", "Z":
			score += 10
		}
	}
	return score
}