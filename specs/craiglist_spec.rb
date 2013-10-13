require_relative 'spec_helper'
require_relative '../models/item'
require_relative '../models/user'


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
  # it { should belong_to(:user) } ASK BRANDON HOW TO IMPLEMENT, getting errors
end

describe User do
  before(:each) do
    @current_user = User.create(username: "og_megabot")
  end

  it "should have a username" do
    expect(@current_user.username).to eq("og_megabot")
  end

  # it { should have_many(:items)}
end
