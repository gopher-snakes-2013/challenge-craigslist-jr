require 'spec_helper'

feature 'User can sign in' do
  before :each do
    visit('/')
    fill_in('sign_in_username', with: 'Steven')
    fill_in('sign_in_password', with: 'password')
    click_button('Sign In')
  end

  scenario "user signs in and is welcomed" do
    expect(page).to have_content('Welcome, Steven')
  end
end