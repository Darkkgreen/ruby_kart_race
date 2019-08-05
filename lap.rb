# frozen_string_literal:true

# Class that controls every lap found on the input file
class Lap
  attr_accessor :number, :time, :average_speed

  def initialize(lap_number, lap_time, lap_average_speed)
    @number = lap_number
    @time = convert_lap_time(lap_time)
    @average_speed = convert_avg_speed(lap_average_speed)
  end

  private

  def convert_avg_speed(value)
    value.sub(',', '.').to_f
  end

  def convert_lap_time(value)
    value
  end

  def <=>(other)
    time <=> other.time
  end
end
