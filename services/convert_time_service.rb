# frozen_string_literal:true

module Service
  # Service that converts a time from String to Object
  class ConvertTimeService
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
      hour = @time[0].to_f * 60 * 60
      minute = @time[1].to_f * 60
      second = @time.last.to_f
      hour + minute + second
    end
  end
end
