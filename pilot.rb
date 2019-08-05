# frozen_string_literal:true

require_relative 'lap'

# Class that control every pilot found on the input file and each of their laps
class Pilot
  attr_accessor :id, :name, :laps

  def initialize(id, name)
    @id = id
    @name = name
    @laps = []
  end

  def register_lap(number, time, average_speed)
    @laps << Lap.new(number, time, average_speed)
  end

  def finished?
    @laps.count == 4
  end

  def best_lap
    @laps.sort!.first.time
  end

  def total_race_time
    @laps.inject(Time.new(0)) { |sum, lap| sum.add(Time.new(lap.time)) }
  end

  def race_average_speed
    total = @laps.inject(0.0) { |sum, lap| sum + lap.average_speed.to_f }
    length = @laps.count
    (total / length).round(3)
  end
end
