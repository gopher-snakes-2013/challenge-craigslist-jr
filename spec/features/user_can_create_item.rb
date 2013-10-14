require 'spec_helper'

feature "User visits homepage" do
  scenario "Homepage exists" do
    visit '/'
    expect(page).to have_content "Buy totally legit stuff on Taylor's list"
  end
end