# frozen_string_literal:true

require_relative '../classes/lap'

module Service
  # Service that correctly creates the lap
  class CreateLapService
    def initialize(number, time, speed)
      @number = number
      @time = time
      @speed = speed
    end

    def create
      Lap.new(@number, @time, @speed)
    end
  end
end
