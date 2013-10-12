require 'sinatra/activerecord/rake'
require './craiglist_app'
# require 'activerecord'
# require 'sqlite3'

begin
  require "rspec/core/rake_task"
  desc "Run all examples"
  RSpec::Core::RakeTask.new(:spec) do |t|
    t.rspec_opts = %w[--color]
  end

  task :default => :spec
  rescue LoadError
end