require 'spec_helper'


feature "guest can create listings" do

before(:each) do
  Listing.destroy_all
end



  scenario "visit to post something" do
    visit '/'
    click_on 'post something'

    fill_in 'listing_title', with: 'derp'
    fill_in 'listing_description', with: 'please deliver'
    fill_in 'listing_price', with: '222'
    click_on 'post your listing'
    click_on 'browse our listings'
    
    expect(page).to have_content('derp')
  end

  scenario "see all the listings" do
    Listing.create(title: 'buy sams jacket', description: 'dev bootcamp jacket', price: '1')
    visit '/'
    click_on 'browse our listings'

    expect(page).to have_content('buy sams jacket')
  end

  # scenario "clicking on a list should take you to its page" do
  #   visit '/'
  #   click_on 'browse our listings'
  #   click_on 'derp'

  #   expect(page).to have_content('please deliver')
  # end



end
