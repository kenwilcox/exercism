let expectedMinutesInOven = 40
let prepTimeByLayer = 2

func remainingMinutesInOven(elapsedMinutes: Int) -> Int {
    expectedMinutesInOven - elapsedMinutes
}

func preparationTimeInMinutes(layers: Int) -> Int {
    prepTimeByLayer * layers
}

// TODO: define the 'totalTimeInMinutes' function
func totalTimeInMinutes(layers: Int, elapsedMinutes: Int) -> Int {
    preparationTimeInMinutes(layers: layers) + elapsedMinutes
}