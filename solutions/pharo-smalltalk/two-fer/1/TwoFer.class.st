Class {
    #name: #TwoFer,
    #superclass: #Object,
    #category: #'Exercise@TwoFer'
}

{ #category : #example }
TwoFer >> who [
    ^ 'One for you, one for me.'
]

TwoFer >> who: name [
    ^ 'One for ', name, ', one for me.'
]