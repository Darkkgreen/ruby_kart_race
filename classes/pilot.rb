# frozen_string_literal:true

require_relative '../services/create_lap_service'
require_relative '../services/convert_time_service'
require_relative '../services/race_best_lap_service'
require_relative '../services/race_total_time_service'
require_relative '../services/race_average_speed_service'

# Class that control every pilot found on the input file and each of their laps
class Pilot
  attr_accessor :id, :name, :laps, :hour_finished

  def initialize(id, name)
    @id = id
    @name = name
    @laps = []
  end

  def register_lap(hour, number, time, average_speed)
    @laps << Service::CreateLapService.new(number, time, average_speed).create
    @hour_finished = Service::ConvertTimeService.new(hour).convert if finished?
  end

  def finished?
    @laps.count == 4
  end

  def best_lap
    Service::RaceBestLapService.new(@laps).execute
  end

  def total_race_time
    Service::RaceTotalTimeService.new(@laps).execute
  end

  def race_average_speed
    Service::RaceAverageSpeedService.new(@laps).execute
  end
end
