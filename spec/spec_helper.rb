$LOAD_PATH.unshift(File.expand_path('.'))
require 'app'
require 'shoulda-matchers'
require 'capybara/rspec'

Capybara.app = Sinatra::Application

RSpec.configure do |config|
  config.before do
    Item.destroy_all
  end
end
