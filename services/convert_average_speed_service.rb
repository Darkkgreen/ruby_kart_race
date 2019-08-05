# frozen_string_literal:true

module Service
  # Service that converts correctly the average speed to float
  class ConvertAverageSpeedService
    def initialize(speed)
      @speed = speed
    end

    def convert
      @speed.sub(',', '.').to_f
    end
  end
end
