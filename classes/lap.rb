# frozen_string_literal:true

require_relative '../services/convert_lap_time_service'
require_relative '../services/convert_average_speed_service'

# Class that controls every lap found on the input file
class Lap
  attr_accessor :number, :time, :avgspd

  def initialize(lap_number, lap_time, avgspd)
    @number = lap_number
    @time = Service::ConvertLapTimeService.new(lap_time).convert
    @avgspd = Service::ConvertAverageSpeedService.new(avgspd).convert
  end

  private

  def <=>(other)
    time <=> other.time
  end
end
