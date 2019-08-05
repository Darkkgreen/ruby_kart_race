# frozen_string_literal:true

require_relative 'classes/race'
require_relative 'services/print_results_service'

def read_file(file_name)
  File.open(file_name).each_with_index do |line, index|
    @race.read_lap(line.split(' ')) unless index.zero?
  end
rescue Errno::ENOENT
  puts "The specified file doesn't exists"
end

def write_result(podium)
  Service::PrintResultsService.new(podium).execute
end

@race = Race.new
read_file(ARGV[0].nil? ? 'entry.txt' : ARGV[0])
write_result(@race.results)
