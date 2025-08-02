Red [
	description: {"Two-fer" exercise solution for exercism platform}
	author: "Ken Wilcox" ; you can write your name here, in quotes
]

two-fer: function [
	name [string! none!]
] [
    person: either name = none [ "you" ][ name ]
	rejoin [
		"One for " person ", one for "
		"me."
	]
]
