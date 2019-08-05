# frozen_string_literal:true

module Service
  # Service that register the pilot lap
  class PrintResultsService
    def initialize(podium)
      @podium = podium
      @first = @podium.first
    end

    def execute
      @podium.each_with_index do |racer, index|
        print_pilot_info(racer, index)
        print_calculated_info(racer)
        new_line(index)
      end
    end

    private

    def new_line(index)
      puts "\n" if index != @podium.count - 1
    end

    def print_pilot_info(pilot, index)
      puts "Posição: #{index + 1}"
      puts "#{pilot.id} - #{pilot.name}"

      if index.zero?
        puts "Voltas: #{pilot.laps.count}"
      else
        puts "Voltas: #{pilot.laps.count} (+ #{time_after_winner(pilot)})"
      end
    end

    def print_calculated_info(pilot)
      puts "Melhor volta: #{pilot.best_lap}"
      puts "Tempo total de prova: #{pilot.total_race_time}"
      puts "Velocidade média: #{pilot.race_average_speed}"
    end

    def time_after_winner(pilot)
      Time.at(pilot.hour_finished.to_f - @first.hour_finished.to_f)
          .strftime('%M:%S.%L')
    end
  end
end
