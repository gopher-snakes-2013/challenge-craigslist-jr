require 'spec_helper'

feature "Guest may list items for sale" do
  scenario "Guest fills out required fields"
    visit '/'
    click_on "Get Rid of Your Shit!"

    fill_in "title", with: "Giant Stone Monkey Head"
    fill_in "desc", with: "This is the second biggest monkey head I've ever sold!"
    fill_in "price", with: "$450"

    click_on "I Don't Want This Anymore!"

    expect(page).to have_content("")

  scenario "Guest submits information to database"
end
