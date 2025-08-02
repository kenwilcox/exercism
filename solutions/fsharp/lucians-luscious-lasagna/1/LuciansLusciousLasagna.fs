module LuciansLusciousLasagna
let expectedMinutesInOven = 40
let remainingMinutesInOven x =
    expectedMinutesInOven - x
let preparationTimeInMinutes layers =
    layers * 2
let elapsedTimeInMinutes layers timeInOven =
    (preparationTimeInMinutes layers) + timeInOven