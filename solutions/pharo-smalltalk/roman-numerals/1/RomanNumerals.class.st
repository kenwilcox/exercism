Class {
  #name: #RomanNumerals,
  #superclass: #Object,
  #category: #'RomanNumerals@Acronym'
}

{ #category: #'example'}
RomanNumerals class >> charMappings [
    ^ Mappings ifNil: [
        Mappings := OrderedDictionary newFrom: {
          (1000 -> 'M').
          (900 -> 'CM').
          (500 -> 'D').
          (400 -> 'CD').
          (100 -> 'C').
          (90 -> 'XC').
          (50 -> 'L').
          (40 -> 'XL').
          (10 -> 'X').
          (9 -> 'IX').
          (5 -> 'V').
          (4 -> 'IV').
          (1 -> 'I').
        }
    ]
]

{ #category: #'example'}
RomanNumerals >> romanNumber: number [
    | remaining |
    remaining := number.
    ^ String streamContents: [:ret |
      self class charMappings keysAndValuesDo: [ :n :roman |
        [ n <= remaining ] whileTrue: [
            remaining := remaining - n.
            ret nextPutAll: roman]
        ]
      ]
]