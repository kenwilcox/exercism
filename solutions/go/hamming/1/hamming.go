/*
Package hamming implements a simple library for calculating the Hamming Distance of two DNA strands.
*/
package hamming

import "fmt"

// Distance returns the hamming distance of two DNA strands or an error if they are not the same length.
func Distance(a, b string) (int, error) {
	count := 0
	if len(a) != len(b) {
		//error := Error("sequences are not the same length")
		return count, fmt.Errorf("sequences are not the same length")
	}
	max := len(a)
	for i := 0; i < max; i++ {
		if string([]rune(a)[i]) != string([]rune(b)[i]) {
			count++
		}
	}
	return count, nil
}