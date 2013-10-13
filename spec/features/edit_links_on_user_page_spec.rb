require 'spec_helper'

feature 'User can see profile page' do
  before :each do
    visit('/')
    fill_in("sign_in_username", with: "Steven")
    fill_in("sign_in_password", with: "password")
    click_button("Sign In")
    click_link("Visit Profile Page")
  end

  scenario "user sees links to their listings" do
    expect(page).to have_link('Edit: iPad')
  end
end