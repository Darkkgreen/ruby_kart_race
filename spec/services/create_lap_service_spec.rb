# frozen_string_literal:true

describe 'CreateLapService' do
  context 'execution' do
    it 'should create a new lap when called' do
      lap = Service::CreateLapService.new('1', '1:04.244', '40,000').create

      expect(lap.is_a?(Lap)).to be_truthy
    end
  end
end
