require 'spec_helper'

feature "guest visits the homepage" do
  scenario "they see HegesList" do
    visit "/"
    expect(page).to have_content "HedgesList"
  end
  
  scenario "they see some content" do
    visit "/"
    expect(page).to have_content "A place where you can sell all the things!"
  end

  scenario "visit new page from home page to create post" do
      visit "/"
      click_on "post something"
      expect(page).to have_content "Post all the things!"
  end

  scenario "visit all sales page from home page" do
    visit "/"
    click_on "browse our listings"
    expect(page).to have_content "Listings of all the things!"
  end


end
