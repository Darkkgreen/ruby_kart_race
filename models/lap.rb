# frozen_string_literal:true

# Class that controls every lap found on the input file
class Lap
  extend Utils
  attr_accessor :number, :time, :avgspd

  def initialize(lap_number, lap_time, avgspd)
    @number = lap_number
    raise TypeError if @number.to_i.zero?

    @time = Utils::Converter.convert_time(lap_time)
    @avgspd = Utils::Converter.convert_speed(avgspd)
  rescue TypeError
    puts 'Lap time arguments were wrong'
    puts 'Please, verify file format'
    raise TypeError
  end

  private

  def <=>(other)
    time <=> other.time
  end
end
