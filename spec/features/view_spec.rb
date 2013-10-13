require 'spec_helper'

feature "VIEWS" do
  background do
    visit '/'
    @name = Faker::Name.first_name
  end

  scenario "guest visits home page" do
    expect(page).to have_content("craigslist")
  end

  scenario "guest can sign up" do
    # page.all(:fillable_field, "username")[2].set(@name)
    # page.all(:fillable_field, "password")[2].set("password")
    click_on "SIGN UP"
    expect(page).to have_content("hey #{@name}")
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