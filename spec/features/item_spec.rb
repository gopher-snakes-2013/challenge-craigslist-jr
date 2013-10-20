require 'spec_helper'

include Rack::Test::Methods

def app
  Sinatra::Application
end

describe Item do
  context "checking validations" do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:price) }
  end
end
