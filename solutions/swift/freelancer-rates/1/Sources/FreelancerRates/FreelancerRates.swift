let billableDays = 22.0

func dailyRateFrom(hourlyRate: Int) -> Double {
  Double(hourlyRate) * 8.0
}

func monthlyRateFrom(hourlyRate: Int, withDiscount discount: Double) -> Double {
  let discount = billableDays - (billableDays*discount/100)
  let pay = dailyRateFrom(hourlyRate: hourlyRate) * discount
  return pay.rounded()
}

func workdaysIn(budget: Double, hourlyRate: Int, withDiscount discount: Double) -> Double {
  let dailyRate = monthlyRateFrom(hourlyRate: hourlyRate, withDiscount: discount) / 22
  return Double(budget / dailyRate).rounded(.down)
}
