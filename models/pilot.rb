# frozen_string_literal:true

# Class that control every pilot found on the input file and each of their laps
class Pilot
  extend Utils
  attr_accessor :id, :name, :laps, :hour_finished

  def initialize(id, name)
    @id = id
    raise TypeError if @id.to_i.zero?

    @name = name
    @laps = []
  rescue TypeError
    puts 'Wrong pilot id'
    puts 'Please check your file'
    raise TypeError
  end

  def register_lap(hour, number, time, average_speed)
    @laps << Service::CreateLapService.new(number, time, average_speed).create
    @hour_finished = Utils::Converter.convert_time(hour) if finished?
  end

  def finished?
    @laps.count == 4
  end

  def best_lap
    Service::GeneratePilotRaceInfoService.new(@laps).best_lap
  end

  def total_race_time
    Service::GeneratePilotRaceInfoService.new(@laps).total_race_time
  end

  def race_average_speed
    Service::GeneratePilotRaceInfoService.new(@laps).average_speed
  end

  private

  def <=>(other)
    hour_finished <=> other.hour_finished
  end
end
