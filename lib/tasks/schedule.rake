namespace :schedule do
  desc "Load the schedule file"
  task :load => :environment do
    f = File.open("#{RAILS_ROOT}/lib/tasks/data/dodgers_2010_schedule.csv", 'r')
    f.each_line do |line|
      day = line.split(',')
    end
  end
  
  desc "Unload the schedule"
  task :unload => :environment do
  end
end