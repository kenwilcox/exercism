/*
Package acronym implements a simple library for converting long words to an Acronym
*/
package acronym

import (
	"strings"
)

// Abbreviate takes a string s and returns the Abbreviation
func Abbreviate(s string) string {
	f := func(c rune) bool {
		return c == ' ' || c == '-' || c == '_'
	}
	parts := strings.FieldsFunc(strings.ToUpper(s), f)
	abb := ""
	for _, word := range parts {
		abb += string([]rune(word)[0])
	}

	return abb
}
