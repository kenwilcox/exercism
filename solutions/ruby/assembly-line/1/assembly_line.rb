class AssemblyLine
  def initialize(speed)
    @speed = speed
  end

  # 1 to 4: 100% success rate.
  # 5 to 8: 90% success rate.
  # 9: 80% success rate.
  # 10: 77% success rate.
  def production_rate_per_hour
    rate = @speed * 221
    if @speed > 4 && @speed <= 8
      rate *= 0.9
    elsif @speed == 9
      rate *= 0.8
    elsif @speed == 10
      rate *= 0.77
    end
    rate
  end

  def working_items_per_minute
    (production_rate_per_hour / 60).to_i
  end
end
