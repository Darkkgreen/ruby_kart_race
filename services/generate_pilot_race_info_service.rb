# frozen_string_literal:true

module Service
  # Service that generates the pilot's information
  class GeneratePilotRaceInfoService
    def initialize(laps)
      @laps = laps
    end

    def best_lap
      format(@laps.sort!.first.time)
    end

    def average_speed
      (total / length).round(3)
    end

    def total_race_time
      format(Time.at(transform_time))
    end

    private

    def total
      @laps.inject(0.0) { |sum, lap| sum + lap.avgspd }
    end

    def length
      @laps.count
    end

    def transform_time
      @laps.inject(Time.at(0)) { |sum, lap| sum.to_f + lap.time.to_f }
    end

    def format(time)
      time.strftime('%M:%S.%L')
    end
  end
end
