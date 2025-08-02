/*
Package grains implements how many grains would be on a chess board square doubling every time
*/
package grains

import "fmt"

// Square returns the number of grains on the square passed in
func Square(input int) (uint64, error) {
	if input == 1 {
		return 1, nil
	}
	if input < 1 {
		return 0, fmt.Errorf("input is less than zero")
	}
	if input > 64 {
		return 0, fmt.Errorf("input is greater than 64")
	}

	doubled := uint64(1)
	for i := 2; i <= input; i++ {
		doubled *= 2
	}
	return uint64(doubled), nil
}

// Total returns the total number of grains on a chessboard
func Total() uint64 {
	sum := uint64(0)
	for i := 1; i < 65; i++ {
		if val, err := Square(i); err == nil {
			sum += val
		}
	}
	return sum
}