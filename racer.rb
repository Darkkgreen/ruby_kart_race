class Pilot
  def initialize(pilot_id, pilot_name)
    @pilot_id = pilot_id
    @pilot_name = pilot_name
  end

  def lap_completed(number, time, average_speed)
    @laps << Lap.new(number, time, average_speed)
  end

  def total_race_time
    return @laps.reduce(&time:+)
  end

  def total_average_speed
    return @laps.reduce(&average_speed:+)
  end
end
