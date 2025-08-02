func canIBuy(vehicle: String, price: Double, monthlyBudget: Double) -> String {
  let numberOfMonths:Double = 12 * 5 // five years
  let affordCost = numberOfMonths * monthlyBudget

  if price < affordCost {
    return "Yes! I'm getting a \(vehicle)"
  } else {
    let leeway = abs(affordCost - price) / affordCost
    if leeway < 0.1 {
      return "I'll have to be frugal if I want a \(vehicle)"
    }
    return "Darn! No \(vehicle) for me"
  }

}

func licenseType(numberOfWheels wheels: Int) -> String {
   switch wheels {
   case 2...3: return "You will need a motorcycle license for your vehicle"
   case 4...6: return "You will need an automobile license for your vehicle"
   case 18: return "You will need a commercial trucking license for your vehicle"
   default: return "We do not issue licenses for those types of vehicles"
   }
}

func registrationFee(msrp: Int, yearsOld: Int) -> Int {
    guard yearsOld <= 10 else { return 25 }

    let baseCost = max(msrp, 25_000)
    let discount = Double(baseCost) - (Double(yearsOld) * 0.1)
    return Int((discount / 100).rounded(.down))
}
