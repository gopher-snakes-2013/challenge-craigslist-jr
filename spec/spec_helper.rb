$LOAD_PATH.unshift(File.expand_path('.'))
require 'capybara/rspec'
require './app'
require 'shoulda-matchers'


Capybara.app = Sinatra::Application

RSpec.configure do |config|
  config.before do
    Item.destroy_all
    #User.destroy_all
  end
end