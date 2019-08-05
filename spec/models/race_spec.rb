# frozen_string_literal:true

# rubocop:disable Metrics/BlockLength
describe Race do
  context 'functions' do
    before do
      @race = Race.new
    end
    it 'should register a lap and a pilot under the Race class' do
      entry = '23:49:08.277 038 – F.MASSA 1 1:02.852 44,275'
      @race.read_lap(entry.split(' '))

      expect(@race.pilots.first.name).to eql('F.MASSA')
    end

    it 'should order the podium according to finishing times' do
      entry = '23:49:10.858 033 – R.BARRICHELLO 1	1:04.352 43,243'
      @race.read_lap(entry.split(' '))
      entry = '23:49:11.075 002 – K.RAIKKONEN 1 1:04.108 43,408'
      @race.read_lap(entry.split(' '))
      entry = '23:50:14.860 033 – R.BARRICHELLO 2 1:04.002 43,48'
      @race.read_lap(entry.split(' '))
      entry = '23:50:15.057 002 – K.RAIKKONEN 2 1:03.982 43,493'
      @race.read_lap(entry.split(' '))
      entry = '23:51:18.576 033 – R.BARRICHELLO 3 1:03.716 43,675'
      @race.read_lap(entry.split(' '))
      entry = '23:51:19.044 002 – K.RAIKKONEN 3 1:03.987 43,49'
      @race.read_lap(entry.split(' '))
      entry = '23:52:22.586 033 – R.BARRICHELLO 4 1:04.010 43,474'
      @race.read_lap(entry.split(' '))
      entry = '23:52:22.120 002 – K.RAIKKONEN 4 1:03.076 44,118'
      @race.read_lap(entry.split(' '))

      expect(@race.podium.first.name).to eql('K.RAIKKONEN')
    end
  end
end
# rubocop:enable Metrics/BlockLength
