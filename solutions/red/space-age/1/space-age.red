Red [
	description: {"Space Age" exercise solution for exercism platform}
	author: "Ken Wilcox" ; you can write your name here, in quotes
]

age: function [
	planet
	seconds
] [
	planets: [
		"Mercury" 0.2408467
		"Venus" 0.61519726
 		"Earth" 1.0
		"Mars" 1.8808158
		"Jupiter" 11.862615
		"Saturn" 29.447498
		"Uranus" 84.016846
		"Neptune" 164.79132
		"Pluto" 247.94
    ]

	length: select planets planet
	years: seconds / 31557600.0 / length
	round/to years 0.01
]

