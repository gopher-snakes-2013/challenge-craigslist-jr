require 'spec_helper'

feature 'User can sign up' do
  before :each do
    visit '/'
    fill_in('sign_up_username', with: 'Steven')
    fill_in('sign_up_password', with: 'password')
    click_button('Sign Up')
  end

  scenario "user signs up and is welcomed" do
    expect(page).to have_content('Welcome, Steven')
  end
end