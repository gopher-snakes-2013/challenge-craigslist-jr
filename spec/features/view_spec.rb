require 'spec_helper'

feature "VIEWS" do
  background "guest lists item" do
    visit '/'
    fill_in "title", with: "bicycle"
    fill_in "description", with: "road"
    fill_in "price", with: "100"
    click_on "LIST"
  end

  scenario "guest can see their item" do
    expect(page).to have_content("bicycle - road - 100")
  end

  scenario "guest is given item link" do
    expect(page).to have_content("click to edit your item")
  end

  scenario "guest clicks edit, leads to edit page" do
    click_on "click to edit your item"
    expect(page).to have_content("edit bicycle")
  end

  scenario "guest clicks unique link, edits item, leads to homepage" do
    click_on "click to edit your item"
    click_on "EDIT"
    expect(page).to have_content("craigslist")
  end
end