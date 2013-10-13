require 'spec_helper'

feature "Guest visits home page" do
  scenario "Guest can see a name and description of Craigslist Jr." do
    visit '/'
    expect(page).to have_content("Craigslist Jr.")
    expect(page).to have_content("The Little Brother of Craigslist")
  end
end
