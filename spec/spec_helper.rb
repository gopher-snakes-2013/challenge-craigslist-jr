$LOAD_PATH.unshift(File.expand_path('.'))
require 'hedgeslist_app'
require 'capybara/rspec'
require 'shoulda-matchers'

Capybara.app = Sinatra::Application
