require 'spec_helper'

feature "guest can create listings" do
  visit "/post-a-sale" do
    fill_in 'listing_title', with: 'i want to sell this'
    fill_in 'listing_description', with: 'This is the coolest thing. you should buy it.'
  end
  click_on 'post your listing'


end
