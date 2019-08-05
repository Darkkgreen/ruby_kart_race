# frozen_string_literal:true

module Service
  # Service that generates the average race speed of the pilot
  class RaceAverageSpeedService
    def initialize(laps)
      @laps = laps
    end

    def execute
      (total / length).round(3)
    end

    private

    def total
      @laps.inject(0.0) { |sum, lap| sum + lap.avgspd }
    end

    def length
      @laps.count
    end
  end
end
