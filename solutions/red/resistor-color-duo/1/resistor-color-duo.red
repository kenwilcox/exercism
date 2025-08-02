Red [
	description: {"Resistor Color Duo" exercise solution for exercism platform}
	author: "Ken Wilcox"
]

bands: make map! [
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

value: function [
	colors
] [
	res: 0
	repeat i min length? colors 2 [
		res: res * 10 + select bands colors/:i
    ]
	res
]

