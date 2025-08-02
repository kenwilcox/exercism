/*
Package twofer implements a simple library that passes an Exercism test case.
*/
package twofer

import "fmt"
import "strings"

// ShareWith returns a "one for you, one for me" string
func ShareWith(user string) string {
	if len(strings.TrimSpace(user)) == 0 {
		user = "you"
	}
	return fmt.Sprintf("One for %v, one for me.", user)
}