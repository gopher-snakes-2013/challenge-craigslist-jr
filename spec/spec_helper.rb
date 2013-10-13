$LOAD_PATH.unshift(File.expand_path('.'))
require 'app'
require 'capybara/rspec'
require 'shoulda-matchers'

# RSpec.configure do |config|
#   config.before do
#     Item.destroy_all
#   end
# end