# frozen_string_literal:true

module Service
  # Service that reads the file
  class ReadFileService
    def initialize(file_name, race)
      @file_name = file_name
      @race = race
    end

    def execute
      read_file
    end

    private

    def read_file
      File.open(@file_name).each_with_index do |line, index|
        @race.read_lap(line.split(' ')) unless index.zero?
      end
    rescue Errno::ENOENT
      puts "The specified file doesn't exists"
    end
  end
end
