$LOAD_PATH.unshift(File.expand_path('.'))

require 'craigs_list_app'

require 'capybara/rspec'

Capybara.app = Sinatra::Application

RSpec.configure do |config|
  config.color_enabled = true
end
