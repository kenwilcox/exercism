/*
Package reverse implements a silly string reverse function
*/
package reverse

import "strings"

// String returns a reversed string
func Reverse(word string) string {
	var arr = strings.Split(word, "")
	ret := ""
	for i := len(arr); i > 0; i-- {
		ret += arr[i-1]
	}
	return ret
}