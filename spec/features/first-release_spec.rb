require 'spec_helper'

include Rack::Test::Methods

def app
  Sinatra::Application
end

# before :all do
#   Item.create(title: " F/S Morgan 30/800", description: "2012 Morgan 30/800 Light use, never gigged. Comes with a power brake attenuator. Smoke tolex with black elephant sides. Sparkle grill with white piping", price: "$2000 OBO")
# end

describe 'Home Page' do
  it "should load the home page" do
    get '/'
    expect(last_response).to be_ok
  end
end

describe Item do
  context "checking validations" do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:price) }
  end
end

# Capybara Tests

feature 'Index page' do
  scenario "Item input form" do
    visit '/'

    expect(page).to have_content("Post a CL Jr Ad")
  end

  scenario "Post a new ad to the page" do
    visit '/'
    fill_in "title", with: "2012 Morgan 30/800"
    fill_in "price", with: "$2000 OBO"
    fill_in "description", with: "2012 Morgan 30/800 Light use, never gigged. Comes with a power brake attenuator. Smoke tolex with black elephant sides. Sparkle grill with white piping"

    expect(page).to have_content("2012 Morgan 30/800")
  end
end