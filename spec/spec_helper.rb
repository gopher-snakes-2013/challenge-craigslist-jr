$LOAD_PATH.unshift(File.expand_path('.'))
require 'capybara/rspec'
require 'cljr_app'
require 'shoulda-matchers'

Capybara.app = Sinatra::Application

RSpec.configure do |config|
  config.before do
    # Item.destroy_all
  end
end