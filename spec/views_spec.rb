require 'spec_helper'

def generate_fake_item
  @item = Faker::Commerce.product_name
  @descript = Faker::Company.catch_phrase
  @price = Faker::Number.digit
end

feature "home page" do
  scenario "guest visits home page" do
    visit '/'
    expect(page).to have_content("craigslist")
  end
end

feature "user can sign up, log in" do
  background do
    visit '/'
    fill_in "signup_user", with: "natalie"
    fill_in "signup_pw", with: "password"
    click_on "sign up"
  end

  scenario "guest signs up" do
    expect(page).to have_content("hey #{@name}")
  end

  scenario "guest logs out" do
    click_on "log out"
    expect(page).to have_content("craigslist")
  end

  scenario "guest logs in" do
    click_on "log out"
    fill_in "login_user", with: "natalie"
    fill_in "login_pw", with: "password"
    click_on "log in"
    expect(page).to have_content("hey #{@name}")
  end
end

feature "user can list, edit and delete items" do
  background do
    visit '/'
    fill_in "signup_user", with: "natalie"
    fill_in "signup_pw", with: "password"
    click_on "sign up"
    generate_fake_item
    fill_in "title", with: @item
    fill_in "description", with: @descript
    fill_in "price", with: @price
    click_on "list"
  end

  scenario "user lists item" do
    expect(page).to have_content("#{@item} - #{@descript} - #{@price}")
    expect(page).to have_content("your listings:")
  end

  scenario "user saves edits" do
    click_on "edit"
    generate_fake_item
    fill_in "title", with: @item
    fill_in "description", with: @descript
    fill_in "price", with: @price
    click_on "save"
    expect(page).to have_content("#{@item} - #{@descript} - #{@price}")
  end

  scenario "user deletes item" do
    click_on "delete"
    expect(page).to_not have_content("#{@item} - #{@descript} - #{@price}")
  end
end