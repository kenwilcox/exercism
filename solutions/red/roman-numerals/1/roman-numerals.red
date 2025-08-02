Red [
	description: {"Roman Numerals" exercise solution for exercism platform}
	author: "Ken Wilcox" ; you can write your name here, in quotes
]

table: [
	1000 M
	900 CM
	500 D
	400 CD
	100 C
	90 XC
	50 L 
	40 XL 
	10 X 
	9 IX 
	5 V 
	4 IV 
	1 I
]

roman: function [
	number [integer!] return: [string!]
] [
	numerals: ""
	foreach [val rom] table [
		while [number >= val] [
			append numerals rom
			number: number - val
        ]
    ]
	numerals
]

