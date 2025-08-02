/*
Package luhn implements a simple Luhn algorithm check
*/
package luhn

import (
	"strconv"
	"strings"
)

//Valid returns true if it passes the Luhn algorithm
func Valid(number string) bool {
	number = strings.Replace(number, " ", "", -1)
	len := len(number)
	if len <= 1 {
		return false
	}
	parity := len % 2
	sum := int64(0)
	for i := 0; i < len; i++ {
		c := string([]rune(number)[i])
		if digit, err := strconv.ParseInt(c, 10, 32); err == nil {
			if i%2 == parity {
				digit *= 2
			}
			if digit > 9 {
				digit -= 9
			}
			sum += digit
		} else {
			// invalid digit char, not valid
			return false
		}
	}
	return sum%10 == 0
}