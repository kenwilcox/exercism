class Reactor
  def self.criticality_balanced?(temperature, neutrons_emitted)
    temperature < 800 && neutrons_emitted > 500 && (temperature * neutrons_emitted < 500_000)
  end

  def self.reactor_efficiency(voltage, current, theoretical_max_power)
    efficiency = (voltage * current) / theoretical_max_power
    if efficiency >= 0.8
      return "green"
    elsif efficiency < 0.8 && efficiency >= 0.6
      return "orange"
    elsif efficiency < 0.6 && efficiency >= 0.3
      return "red"
    end
    "black"
  end

  def self.fail_safe(temperature, neutrons_produced_per_second, threshold)
    safe = temperature * neutrons_produced_per_second / threshold
    if safe < 0.9
      return "LOW"
    elsif safe <= 1.1
      return "NORMAL"
    end
    "DANGER"
  end
end
