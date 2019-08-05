# frozen_string_literal:true

require 'require_all'
require_all 'utils'
require_all 'models'
require_all 'services'

@race = Race.new
Service::ReadFileService.new(ARGV[0].nil? ? 'entry.txt' : ARGV[0],
                             @race).execute
Service::PrintResultsService.new(@race.podium).execute
