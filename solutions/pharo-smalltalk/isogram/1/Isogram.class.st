Class {
    #name : #Isogram,
    #superclass : #Object,
    #category : #'Exercise#Isogram'
}

{ #category : #example }
Isogram >> isIsogramPhrase: str [
    | bag |
    bag := str onlyLetters translateToLowercase asBag.
    ^bag allSatisfy: [ :item | (bag occurrencesOf: item) = 1 ]
]