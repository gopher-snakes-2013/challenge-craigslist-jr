require 'spec_helper'

feature 'User can delete posts' do
  before :each do
    visit('/')
    fill_in("sign_in_username", with: "Steven")
    fill_in("sign_in_password", with: "password")
    click_button("Sign In")
    fill_in("title", with: "Used Car")
    fill_in("price", with: "2000")
    fill_in("description", with: "Honda Fit")
    click_button("Post Listing")
    visit('/')
    click_link("Visit Profile Page")
    click_link("Edit: Used Car")
    click_button("Delete Listing")

  end

  scenario "user sees links to their listings" do
    page.should have_no_content('Edit: Used Car')
  end

end