require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

task :default => :spec

desc "Creates a .env file for your application"
task :enviro, [:token] do |t, args|
  if !File.file?(".env")
    f = File.new(".env", "w+")
    f.write("APP_TOKEN='#{args[:token]}'")
    f.close
    puts ".env file with APP_TOKEN has been created"
  else
    puts ".env file already exists"
  end

end
