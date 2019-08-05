# frozen_string_literal:true

require_relative '../utils/converter'

# Class that controls every lap found on the input file
class Lap
  extend Utils
  attr_accessor :number, :time, :avgspd

  def initialize(lap_number, lap_time, avgspd)
    @number = lap_number
    @time = Utils::Converter.convert_time(lap_time)
    @avgspd = Utils::Converter.convert_speed(avgspd)
  end

  private

  def <=>(other)
    time <=> other.time
  end
end
