class SavingsAccount
  def self.interest_rate(balance)
    return 3.213 if balance < 0
    return 0.5 if balance < 1_000
    return 1.621 if balance < 5_000
    2.475
  end

  def self.interest(balance)
    interest_rate(balance) * balance / 100
  end

  def self.annual_balance_update(balance)
    balance + interest(balance)
  end

  def self.years_before_desired_balance(current_balance, target_balance)
    (0..).each_with_index do |years|
      break years if current_balance >= target_balance
      current_balance = annual_balance_update(current_balance)
    end
  end
end
