require 'spec_helper'

feature 'User can see profile page' do
  before :each do
    visit('/')
    fill_in("sign_in_username", with: "Steven")
    fill_in("sign_in_password", with: "password")
    click_button("Sign In")
    fill_in("title", with: "iPad")
    fill_in("price", with: "200")
    fill_in("description", with: "16GB iPad 2")
    click_button("Post Listing")
    visit('/')
    click_link("Visit Profile Page")
  end

  scenario "user sees links to their listings" do
    expect(page).to have_link('Edit: iPad')
  end
end