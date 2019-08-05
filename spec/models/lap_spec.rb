# frozen_string_literal:true

# rubocop:disable Metrics/BlockLength
describe Lap do
  context 'initialize' do
    it 'should return a valid Lap if all the parameters are right' do
      expect do
        Lap.new('1', '1:02.852', '43,243')
      end.to_not raise_error
    end

    it 'should not return a valid Lap if all the parameters are right' do
      expect do
        Lap.new('1', 'abc', '43,243')
      end.to raise_error(TypeError)
    end

    it 'should not return a valid Lap if all the parameters are right' do
      expect do
        Lap.new('a', '1:02.852', '43,243')
      end.to raise_error(TypeError)
    end
  end

  context 'ordering' do
    it 'should order an array of Laps' do
      laps = [Lap.new('1', '1:04.025', '40,000')]
      laps << Lap.new('1', '1:03.025', '41,000')
      laps << Lap.new('1', '1:02.025', '42,000')

      laps.sort!

      expect(laps.first
                 .time
                 .to_f).to eql(Utils::Converter.convert_time('1:02.025')
                                               .to_f)
    end
  end
end
# rubocop:enable Metrics/BlockLength
