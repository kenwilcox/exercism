Class {
	#name : #Grains,
	#superclass : #Object,
	#category : #'Exercise@Grains'
}

Grains >> atSquare: n [
    ((n < 1) or: [n > 64]) ifTrue: [self error: 'square must be between 1 and 64'].
    ^ 2 ** (n - 1)
]

Grains >> total [^ (1 to: 64) inject: 0 into: [:acc :i | acc + (self atSquare: i)]]
