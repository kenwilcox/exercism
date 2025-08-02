/*
Package bob implements a simple teenager response to statemetns
*/
package bob

import "strings"

// Hey will return snide comments based on how things are said
func Hey(remark string) string {
	// remove spaces from input
	remark = strings.TrimSpace(remark)
	// if string to upper == string to lower then we have non words (eg 1,2,3)
	nowords := strings.ToUpper(remark) == strings.ToLower(remark)

	if !nowords && strings.ToUpper(remark) == remark && strings.HasSuffix(remark, "?") {
		return "Calm down, I know what I'm doing!"
	}

	if !nowords && strings.ToUpper(remark) == remark {
		return "Whoa, chill out!"
	}

	if strings.HasSuffix(remark, "?") {
		return "Sure."
	}

	if len(remark) == 0 {
		return "Fine. Be that way!"
	}

	return "Whatever."
}