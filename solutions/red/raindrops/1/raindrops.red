Red [
	description: {"Raindrops" exercise solution for exercism platform}
	author: "" ; you can write your name here, in quotes
]

convert: function [
	number
] [
	ret: copy ""
	if number % 3 = 0 [ ret: append ret "Pling" ]
	if number % 5 = 0 [ ret: append ret "Plang" ]
	if number % 7 = 0 [ ret: append ret "Plong" ]
  	if 0 = length? ret [ ret: form number ]
	ret
]

