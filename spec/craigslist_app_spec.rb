require 'spec_helper'


# Release 1

# Guest may edit the item with the secret URL they are given after listing an item

feature "guest visits page" do
  scenario "they see title of page" do
    visit "/"
    expect(page).to have_content "Craigslist, jr."
  end

  scenario "they see input fields for item, describe, submit" do
    visit '/'
    find_field('List your item')
    find_field('Describe your item')
    find_field('Your price')
  end

  scenario "they can list an item" do
     visit '/'
     fill_in('title', :with => 'Random Item')
     fill_in('description', :with => 'random item that does random things.')
     fill_in('price', :with => '1')
  end
end

describe Item do
  context "check if form is filled out completely and correctly" do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:price) }
    it { should validate_numericality_of(:price) }
  end
end