require 'sinatra/activerecord/rake'
require './hedgeslist_app.rb'


namespace :db do

  desc "create the database"
  task :createlist do
    puts "creating database"
  end

end


begin
  require "rspec/core/rake_task"

  desc "Run all examples"
  RSpec::Core::RakeTask.new(:spec)
  task :defult => :spec

rescue LoadError
end
