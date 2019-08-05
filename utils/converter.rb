# frozen_string_literal:true

module Utils
  # Util that converts objects
  class Converter
    def self.convert_time(time)
      split_time(time)
      Time.at(generate_value)
    end

    def self.convert_speed(speed)
      speed.sub(',', '.').to_f
    end

    def self.split_time(time)
      @time = time.split(':')
    end

    def self.generate_value
      calculate_milliseconds(@time.size)
    end

    def self.calculate_milliseconds(size)
      @time.inject(0.0) do |sum, time|
        size -= 1
        sum + (time.to_f * (60**size))
      end
    end
  end
end
