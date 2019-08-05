# frozen_string_literal:true

module Service
  # Service that calculate the pilot's race time
  class RaceTotalTimeService
    def initialize(laps)
      @laps = laps
    end

    def execute
      Time.at(transform_time).strftime('%M:%S.%L')
    end

    private

    def transform_time
      @laps.inject(Time.at(0)) { |sum, lap| sum.to_f + lap.time.to_f }
    end
  end
end
