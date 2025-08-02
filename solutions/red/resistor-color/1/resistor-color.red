Red [
	description: {"Resistor Color" exercise solution for exercism platform}
	author: "Ken Wilcox" ; you can write your name here, in quotes
]

color-code: function [
	color
] [
	select allcolors color
]

colors: function [] [
	foreach k keys-of allcolors
]

allcolors: function [] [
	make map! [
	"black" 0
	"brown" 1
	"red" 2
	"orange" 3
	"yellow" 4
	"green" 5
	"blue" 6
	"violet" 7
	"grey" 8
	"white" 9
	]
]

