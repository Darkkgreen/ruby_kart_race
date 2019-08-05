# frozen_string_literal:true

require_relative 'race'

def read_file(file_name)
  File.open(file_name).each_with_index do |line, index|
    @race.readLap(line.split(' ')) unless index.zero?
  end

  write_result(@race.results)
rescue Errno::ENOENT
  puts "The specified file doesn't exists"
end

def write_result(podium)
  podium.each_with_index do |racer, index|
    puts "Posição: #{index + 1},
          Código Piloto: #{racer.id},
          Nome Piloto: #{racer.name},
          Quantidade de voltas completadas: #{racer.laps.count},
          Tempo total de prova: #{racer.race_average_speed}"
  end
end

@race = Race.new
read_file(ARGV[0].nil? ? 'entry.txt' : ARGV[0])
