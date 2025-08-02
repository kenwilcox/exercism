/*
Package gigasecond implements a simple library for adding a gigasecond to a birthdate
*/
package gigasecond

// import path for the time package from the standard library
import "time"

// AddGigasecond takes a time.Time and returns a time.Time when a gigasecond has been reached.
func AddGigasecond(t time.Time) time.Time {
	return t.Add(time.Second * time.Duration(10e8))
}