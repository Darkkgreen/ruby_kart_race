# frozen_string_literal:true

module Service
  # Service that finds the pilot's best lap time
  class RaceBestLapService
    def initialize(laps)
      @laps = laps
    end

    def execute
      @laps.sort!.first.time.strftime('%M:%S.%L')
    end
  end
end
