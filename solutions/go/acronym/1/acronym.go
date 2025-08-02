/*
Package acronym implements a simple library for converting long words to an Acronym
*/
package acronym

import (
	"strings"
)

// Abbreviate takes a string s and returns the Abbreviation
func Abbreviate(s string) string {
	s = strings.ToUpper(strings.Replace(s, "-", " ", -1))
	parts := strings.Split(s, " ")
	abb := ""
	for _, word := range parts {
		abb += string([]rune(word)[0])
	}
	return abb
}