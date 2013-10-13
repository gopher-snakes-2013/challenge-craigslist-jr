require_relative 'spec_helper'
require_relative '../models/item'


describe Item do
  before(:each) do
    @item = Item.create("bike")
  end

  it "should have a title" do
    expect(@item.title).to eq("bike")
  end

  # it "should have a description" do
  #   expect(@itme.description).to eq("dat purple bike doe")
  # end

end
