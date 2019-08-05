# frozen_string_literal:true

# Class that defines the Race, podium and the pilots participating
class Race
  attr_accessor :pilots, :podium

  def initialize
    @pilots = []
    @podium = []
  end

  def read_lap(entry)
    info = hash(entry)
    pilot = Service::InvokePilotService.new(pilots,
                                            info[:id],
                                            info[:name]).execute
    Service::RegisterPilotLapService.new(pilot,
                                         info[:hour],
                                         info[:lap_number],
                                         info[:lap_time],
                                         info[:lap_avg]).execute

    update_podium(pilot)
  end

  def results
    podium
  end

  private

  def update_podium(pilot)
    @podium << pilot if pilot.finished?
    @podium.sort!
  end

  def hash(entry)
    { hour: entry[0],
      id: entry[1],
      name: entry[3],
      lap_number: entry[4],
      lap_time: entry[5],
      lap_avg: entry[6] }
  end
end
