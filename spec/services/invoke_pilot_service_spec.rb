# frozen_string_literal:true

describe 'InvokePilotService' do
  context 'execution' do
    it 'should create another pilot' do
      pilots = []
      Service::InvokePilotService.new(pilots, '1', 'Jabba').execute

      expect(pilots.count).to eql(1)
    end

    it 'should return the pilot' do
      pilots = [Pilot.new('1', 'Jabba')]
      pilots << Pilot.new('2', 'Han Solo')
      result = Service::InvokePilotService.new(pilots, '1', 'Jabba').execute

      expect(result.name).to eql('Jabba')
    end
  end
end
