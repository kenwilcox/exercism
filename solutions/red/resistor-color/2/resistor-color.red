Red [
	description: {"Resistor Color" exercise solution for exercism platform}
	author: "Ken Wilcox" ; you can write your name here, in quotes
]

color-code: function [
	color
] [
	(index? find colors color) - 1
]

colors: [
	"black"
	"brown"
	"red"
	"orange"
	"yellow"
	"green"
	"blue"
	"violet"
	"grey"
	"white"
]

