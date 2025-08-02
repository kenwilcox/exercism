/*
Package space implements a simple library for calculating an age in seconds to age in years for the various planets in the solar system
*/
package space

// Planet type is just a string
type Planet string

// Age returns the age in years for the given planet
func Age(seconds float64, planet Planet) float64 {
	var age = seconds / getOrbit(planet)
	return age //round(age, 2)
}

func getOrbit(planet Planet) float64 {
	// default to Earth
	orbit := 31557600.0
	switch planet {
	case "Mercury":
		return orbit * 0.2408467
	case "Venus":
		return orbit * 0.61519726
	case "Mars":
		return orbit * 1.8808158
	case "Jupiter":
		return orbit * 11.862615
	case "Saturn":
		return orbit * 29.447498
	case "Uranus":
		return orbit * 84.016846
	case "Neptune":
		return orbit * 164.79132
	}
	return orbit
}

// just in case you do want to round it, but the tests passed without
// func round(v float64, decimals int) float64 {
// 	var pow float64 = 1
// 	for i := 0; i < decimals; i++ {
// 		pow *= 10
// 	}
// 	return float64(int((v*pow)+0.5)) / pow
// }