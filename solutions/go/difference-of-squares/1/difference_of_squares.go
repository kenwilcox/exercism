/*
Package diffsquares implements functions to pass the Exercism test cases
*/
package diffsquares

import "math"

// SquareOfSums returns the square of the sum of numbers up to number
func SquareOfSums(number int) int {
	sum := 0
	for i := 1; i <= number; i++ {
		sum += i
	}
	return int(math.Pow(float64(sum), 2))
}

// SumOfSquares returns the sum squared of the numbers up to number
func SumOfSquares(number int) int {
	sum := 0.0
	for i := 1; i <= number; i++ {
		sum += math.Pow(float64(i), 2)
	}
	return int(sum)
}

// Difference returns the difference of SquareOfSum - SumOfSquares
func Difference(number int) int {
	a := SquareOfSums(number)
	b := SumOfSquares(number)
	return a - b
}