# frozen_string_literal:true

describe 'GeneratePilotRaceInfoService' do
  context 'execution' do
    it 'should return the best lap' do
      lap = Lap.new('1', '1:04.200', '40,000')
      result = Service::GeneratePilotRaceInfoService.new([lap]).best_lap

      expect(result).to eql('01:04.200')
    end

    it 'should return the average speed' do
      lap = Lap.new('1', '1:04.200', '40,000')
      result = Service::GeneratePilotRaceInfoService.new([lap]).average_speed

      expect(result).to eql(40.0)
    end

    it 'should return the total race time' do
      lap = Lap.new('1', '1:04.200', '40,000')
      result = Service::GeneratePilotRaceInfoService.new([lap]).total_race_time

      expect(result).to eql('01:04.200')
    end
  end
end
