namespace :schedule do
  desc "Load the CSV file of the MLB schedule CSV"
  # TODO: Have this file dl the file from MLB's servers
  # Fix the reg-ex
  task :load => :environment do
    f = File.open("#{RAILS_ROOT}/lib/tasks/data/dodgers_2010_schedule.csv", 'r')
    first_line = true
    f.each_line do |line|
      # Skip the header of the CSV file
      if first_line
        first_line = false
      else 
        day = line.split(',')
        teams = day[3].split('at')
        opponent = nil
        away = false
        # Dodgers at White Sox
        if teams.first.downcase =~ /dodger/
          opponent = teams[1].strip
          away = true
        else
          opponent = teams[0].strip
          away = false
        end
        
        # telivision and radio
        # Local TV: KCAL ----- Local Radio: KHJ 930 -- KABC 790 -- DRN
        radio = day[5].match(/Local Radio: (\S.*|[a-zA-Z]*|[0-9])/)
        radio = radio[0].split("--").join(', ') unless radio.nil?
        tv = day[5].match(/Local TV: (\S.*|[a-zA-Z]*|[0-9])/)
        tv = tv[0].split("--").join(', ') unless tv.nil?
        Game.create!(:game_at => DateTime.parse("#{day[0]} #{day[1]} PST"),
                     :location => day[4], 
                     :telivision => tv,
                     :radio => radio,
                     :opponent => opponent,
                     :away => away)
      end
    end
  end
  
  desc "Unload the schedule"
  task :unload => :environment do
    Game.delete_all
  end
end