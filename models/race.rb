# frozen_string_literal:true

require_relative 'pilot'
require_relative '../services/invoke_pilot_service'
require_relative '../services/register_pilot_lap_service'

# Class that defines the Race, podium and the pilots participating
class Race
  attr_accessor :pilots, :podium

  def initialize
    @pilots = []
    @podium = []
  end

  def read_lap(entry)
    pilot = Service::InvokePilotService.new(pilots, entry[1],
                                            entry[3]).execute
    Service::RegisterPilotLapService.new(pilot, entry[0], entry[4],
                                         entry[5], entry[6]).execute

    @podium << pilot if pilot.finished?
    @podium.sort!
  end

  def results
    podium
  end
end
