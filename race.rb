# require_relative 'race'

racers = []

def loadFile(file_name)
  begin
    File.open(file_name).each do |line|
      puts line
      # loadLap(line)
    end
  rescue Errno::ENOENT
    puts "The specified file doesn't exists"
  end
end

def loadLap(entry)
  # divisão da linha em entradas
  # criação das estruturas
  # definição do campeão
end

loadFile(ARGV[0].nil? ? 'entry.txt' : ARGV[0])
