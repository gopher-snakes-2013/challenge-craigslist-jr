require 'spec_helper'

feature 'User can sign up' do
  before :each do
    visit '/sign_up'
    fill_in('sign_up_username', with: 'Kael')
    fill_in('sign_up_password', with: 'password')
    click_button('Sign Up')
  end

  scenario "user signs up and is welcomed" do
    expect(page).to have_content('Welcome, Kael')
  end

  after :each do
    User.last.destroy
  end
end