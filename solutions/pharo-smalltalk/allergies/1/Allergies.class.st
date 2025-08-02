Class {
    #name : #Allergies,
    #superclass : #Object,
    #category : #'Exercism@Allergies'
}

Allergies >> allergens [
    ^ {'eggs'. 'peanuts'. 'shellfish'. 'strawberries'. 'tomatoes'. 'chocolate'. 'pollen'. 'cats'}
]

Allergies >> allergyListForScore: aNumber [
    ^ self allergens withIndexSelect: [:each :i | (aNumber bitAt: i) == 1] .
]

Allergies >> allergicToItem: aString forScore: aNumber [
    ^ (self allergyListForScore: aNumber) includes: aString
]
