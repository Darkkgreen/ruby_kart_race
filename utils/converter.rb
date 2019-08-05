# frozen_string_literal:true

module Utils
  # Util that converts objects
  class Converter
    def self.convert_time(time)
      split_time(time)
      valid?
      Time.at(calculate_milliseconds(@time.size))
    end

    def self.convert_speed(speed)
      speed.sub(',', '.').to_f
    end

    def self.split_time(time)
      @time = time.split(':')
    end

    def self.calculate_milliseconds(size)
      @time.inject(0.0) do |sum, time|
        size -= 1
        sum + (time.to_f * (60**size))
      end
    end

    def self.valid?
      @time.each do |t|
        begin
          Float(t)
        rescue ArgumentError
          raise TypeError
        end
      end
    end
  end
end
