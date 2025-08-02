package cars

// CalculateWorkingCarsPerHour calculates how many working cars are
// produced by the assembly line every hour.
func CalculateWorkingCarsPerHour(productionRate int, successRate float64) float64 {
	return float64(productionRate) * (successRate / 100)
}

// CalculateWorkingCarsPerMinute calculates how many working cars are
// produced by the assembly line every minute.
func CalculateWorkingCarsPerMinute(productionRate int, successRate float64) int {
	return int(CalculateWorkingCarsPerHour(productionRate, successRate) / 60)
}

// CalculateCost works out the cost of producing the given number of cars.
func CalculateCost(carsCount int) uint {
	if carsCount < 10 {
		return uint(carsCount * 10_000)
	}

	var tens = carsCount / 10
	var cost = uint(tens * 95_000)

	var remainder = carsCount % 10
	if remainder == 0 {
		return cost
	}
	var remainderCost = uint(remainder * 10_000)
	return cost + remainderCost
}
