/*
Package raindrops implements a simple library for converting a number to the sound rain makes.
*/
package raindrops

import "strconv"

// Convert takes a number as input and returns a string representation of the sound of rain for it.
func Convert(input int) string {
	val := ""
	if input%3 == 0 {
		val += "Pling"
	}
	if input%5 == 0 {
		val += "Plang"
	}
	if input%7 == 0 {
		val += "Plong"
	}
	if len(val) == 0 {
		val = strconv.Itoa(input)
	}
	return val
}