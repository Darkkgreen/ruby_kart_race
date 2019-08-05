# frozen_string_literal:true

module Service
  # Service that returns a pilot, either finding it or creating it
  class InvokePilotService
    def initialize(list, id, name)
      @list = list
      @id = id
      @name = name
    end

    def execute
      return select_pilot.first if exists?

      pilot = create_pilot
      @list << pilot
      pilot
    end

    private

    def create_pilot
      Pilot.new(@id, @name)
    end

    def exists?
      !select_pilot.empty?
    end

    def select_pilot
      @list.select { |racer| racer.id == @id }
    end
  end
end
