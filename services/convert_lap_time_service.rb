# frozen_string_literal:true

module Service
  # Service that converts a lap time string into a Time object
  class ConvertLapTimeService
    def initialize(time_string)
      @time = time_string
    end

    def convert
      split_time
      Time.at(generate_value)
    end

    private

    def split_time
      @time = @time.split(':')
    end

    def generate_value
      minute = @time.first.to_f * 60
      second = @time.last.to_f
      minute + second
    end
  end
end
