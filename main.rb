# frozen_string_literal:true

require_relative 'models/race'
require_relative 'services/print_results_service'
require_relative 'services/read_file_service'

@race = Race.new
Service::ReadFileService.new(ARGV[0].nil? ? 'entry.txt' : ARGV[0],
                             @race).execute
Service::PrintResultsService.new(@race.podium).execute
