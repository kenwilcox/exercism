/*
Package clock implements a simple clock struct that you can add and subtract time from
*/
package clock

import "fmt"

// Clock provides Hours and Minutes
type Clock struct {
	hours   int
	minutes int
}

// New creates a new Clock struct
func New(hours, minutes int) Clock {
	clock := Clock{hours, minutes}
	clock.setHours(hours)
	clock.setMinutes(minutes)
	return clock
}

// The setters handle the odometer effect
func (c *Clock) setHours(hours int) {
	c.hours = hours
	if c.hours < 0 {
		c.setHours(24 + c.hours) // 24 + -1
	}
	if c.hours >= 24 {
		c.setHours(c.hours - 24)
	}
}

// Hours returns the number of hours
func (c *Clock) Hours() int {
	return c.hours
}

// The setters handle the odometer effect
func (c *Clock) setMinutes(minutes int) {
	c.minutes = minutes
	if c.minutes < 0 {
		c.setMinutes(60 + c.minutes)
		c.setHours(c.Hours() - 1)
	}

	if c.minutes >= 60 {
		hours := c.minutes / 60
		c.setHours(c.Hours() + hours)
		c.setMinutes(c.minutes % 60)
	}
}

// Minutes returns the number of minutes
func (c *Clock) Minutes() int {
	return c.minutes
}

func (c Clock) String() string {
	return fmt.Sprintf("%02d:%02d", c.Hours(), c.Minutes())
}

func abs(val int) int {
	if val < 0 {
		return -val
	}
	if val == 0 {
		return 0
	}
	return val
}

// Add adds stuff
func (c Clock) Add(minutes int) Clock {
	if minutes < 0 {
		c.Subtract(abs(minutes))
	}
	hours := minutes / 60
	minutes = minutes % 60
	c.setHours(c.Hours() + hours)
	c.setMinutes(c.Minutes() + minutes)
	return c
}

// Subtract subtracts stuff
func (c Clock) Subtract(minutes int) Clock {
	hours := minutes / 60
	minutes = minutes % 60
	c.setHours(c.Hours() - hours)
	c.setMinutes(c.Minutes() - minutes)
	return c
}