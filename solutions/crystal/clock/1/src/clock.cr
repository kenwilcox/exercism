class Clock
  getter hour : Int32
  getter minute : Int32
  def initialize(hour : Int32 = 0, minute : Int32 = 0) : Clock
    extra = minute.divmod(60).first
    @hour = (hour + extra) % 24
    @minute = minute % 60
    self
  end

  def to_s : String
    sprintf("%02i", hour) + ":" + sprintf("%02i", minute)
  end

  def ==(clock) : Bool
    @hour == clock.hour && @minute == clock.minute
  end

  def +(clock) : Clock
    Clock.new(@hour + clock.hour, @minute + clock.minute)
  end

  def -(clock) : Clock
    Clock.new(@hour - clock.hour, @minute - clock.minute)
  end
end
