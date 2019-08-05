# frozen_string_literal:true

module Service
  # Service that register the pilot lap
  class RegisterPilotLapService
    def initialize(pilot, hour, number, time, velocity)
      @pilot = pilot
      @hour = hour
      @number = number
      @time = time
      @velocity = velocity
    end

    def execute
      @pilot.register_lap(@hour, @number, @time, @velocity)
    end
  end
end
