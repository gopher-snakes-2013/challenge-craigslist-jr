require './app'
require 'sinatra/activerecord/rake'

begin
  require "rspec/core/rake_task"
  desc "run all examples"
  RSpec::Core::RakeTask.new(:spec) do |t|
    t.rspec_opts = %w[-fd --color]
    t.pattern = 'spec/*_spec.rb'
  end

  task :default => :spec
rescue LoadError
end