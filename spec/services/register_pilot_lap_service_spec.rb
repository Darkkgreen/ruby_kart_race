# frozen_string_literal:true

describe 'RegisterPilotLapService' do
  context 'execution' do
    it 'should register the lap inside the pilot object' do
      pilot = Pilot.new('1', 'Jabba')
      Service::RegisterPilotLapService.new(pilot,
                                           '10:10:10.000',
                                           '1',
                                           '1:04.000',
                                           '40,000').execute

      expect(pilot.laps.first.number).to eql('1')
    end
  end
end
