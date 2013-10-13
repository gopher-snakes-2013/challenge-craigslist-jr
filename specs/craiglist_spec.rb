require_relative 'spec_helper'
require_relative '../models/item'


describe Item do
  before(:each) do
    @item = Item.create(title: "bike", description: "dat purple bike doe", price: "24.34")
  end

  it "should have a title" do
    expect(@item.title).to eq("bike")
  end

  it "should have a description" do
    expect(@item.description).to eq("dat purple bike doe")
  end

  it "should have a price" do
    expect(@item.price).to eq("24.34")
  end
end
