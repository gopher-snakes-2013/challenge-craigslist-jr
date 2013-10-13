ENV['RACK_ENV'] ||= 'test'

require './app'
require 'capybara/rspec'
require 'shoulda-matchers'
require 'faker'

Capybara.app = Sinatra::Application

ActiveRecord::Base.logger = Logger.new('/dev/null')

RSpec.configure do |config|
  config.before do
    Item.destroy_all
  end
end