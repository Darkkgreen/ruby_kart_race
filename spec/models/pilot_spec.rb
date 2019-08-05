# frozen_string_literal:true

# rubocop:disable Metrics/BlockLength
describe Pilot do
  context 'initialize' do
    it 'should return a valid Pilot if all parameters are right' do
      expect do
        Pilot.new('1', 'Jabba')
      end.to_not raise_error
    end

    it 'should raise an error id is not an integer' do
      expect do
        Pilot.new('0', 'Jabba')
      end.to raise_error(TypeError)
    end
  end

  context 'functions' do
    it 'finished? should return true if pilot finished the race' do
      pilot = Pilot.new('1', 'Jabba')
      pilot.register_lap('10:11:10.000', '1', '1:04.255', '40,000')
      pilot.register_lap('10:11:20.000', '2', '1:04.255', '40,000')
      pilot.register_lap('10:11:30.000', '3', '1:04.255', '40,000')
      pilot.register_lap('10:11:40.000', '4', '1:04.255', '40,000')

      expect(pilot.finished?).to be_truthy
    end

    it 'best_lap should return the pilots best lap' do
      pilot = Pilot.new('1', 'Jabba')
      pilot.register_lap('10:11:10.000', '1', '1:04.000', '40,000')
      pilot.register_lap('10:11:20.000', '2', '1:04.255', '40,000')

      expect(pilot.best_lap).to eql('01:04.000')
    end

    it 'total_race_time should return the pilots total_time' do
      pilot = Pilot.new('1', 'Jabba')
      pilot.register_lap('10:11:10.000', '1', '1:04.000', '40,000')

      expect(pilot.total_race_time).to eql('01:04.000')
    end

    it 'race_average_speed should return the pilots average speed' do
      pilot = Pilot.new('1', 'Jabba')
      pilot.register_lap('10:11:10.000', '1', '1:04.000', '40,000')
      pilot.register_lap('10:11:20.000', '2', '1:04.255', '41,000')

      expect(pilot.race_average_speed).to eql(40.5)
    end
  end

  context 'ordering' do
    it 'should order an array of Pilots' do
      pilots = [Pilot.new('1', 'Jabba')]
      pilots << Pilot.new('2', 'Han Solo')
      pilots << Pilot.new('3', 'Chewbacca')

      pilots[2].register_lap('10:10:10.000', '1', '1:04.255', '40,000')
      pilots[2].register_lap('10:10:20.000', '2', '1:04.255', '40,000')
      pilots[2].register_lap('10:10:30.000', '3', '1:04.255', '40,000')

      pilots[1].register_lap('10:10:40.000', '1', '1:04.255', '40,000')
      pilots[1].register_lap('10:10:50.000', '2', '1:04.255', '40,000')
      pilots[1].register_lap('10:11:00.000', '3', '1:04.255', '40,000')

      pilots[0].register_lap('10:11:10.000', '1', '1:04.255', '40,000')
      pilots[0].register_lap('10:11:20.000', '2', '1:04.255', '40,000')
      pilots[0].register_lap('10:11:30.000', '3', '1:04.255', '40,000')

      pilots.sort!

      expect(pilots.first.id.to_i).to eql(1)
    end
  end
end
# rubocop:enable Metrics/BlockLength
