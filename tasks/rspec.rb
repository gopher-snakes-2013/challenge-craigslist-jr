#understand this file

begin
  require "respec/core/rake_task"
  desc "Run all examples"
  Rspec::Core::RakeTask.new(:spec)

  task :default => :spec

  rescue Load Error
end
