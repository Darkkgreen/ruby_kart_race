# frozen_string_literal:true

require_relative 'pilot'

# Class that defines the Race, podium and the pilots participating 
class Race
  attr_accessor :pilots, :podium

  def initialize
    @pilots = []
    @podium = []
  end

  def read_lap(entry)
    pilot = create_pilot(entry[1], entry[3])
    pilot.register_lap(entry[4], entry[5], entry[6])

    @podium << pilot if pilot.finished?
  end

  def results
    podium
  end

  private

  def create_pilot(id, name)
    return search_pilot(id).first unless search_pilot(id).empty?

    pilot = Pilot.new(id, name)
    @pilots << pilot

    pilot
  end

  def search_pilot(id)
    @pilots.select { |racer| racer.id == id }
  end
end
