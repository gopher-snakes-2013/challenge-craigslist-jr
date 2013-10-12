require 'spec_helper'

describe Listing do
  describe '#listingtitle' do
    it {should validate_presence_of(:title)}
  end
  describe '#listingdescribtion' do
    it {should validate_presence_of(:description)}
  end
end
