require 'spec_helper'

feature "Guest may list items for sale" do

  def list_item(item)
    visit "/"
    click_on "Get Rid of Your Stuff"

    fill_in "title", with: item[:title]
    fill_in "desc", with:  item[:desc]
    fill_in "price", with: item[:price]

    click_on "I Don't Want This"
  end

  context "When valid item details are provided" do
    let(:item_details) do
      {
        title: "Giant Stone Monkey Head",
        desc: "This is the second biggest monkey head I've ever sold!",
        price: "$450"
      }
    end

    scenario "Guest receives a confirmation" do
      list_item(item_details)
      expect(page).to have_content("You're So Generous!")
    end

    scenario "Guest can view the items they have listed" do
      list_item(item_details)

      click_on "Look at Your Stuff"

      expect(page).to have_content("Giant Stone Monkey Head")
      expect(page).to have_content("This is the second biggest monkey head I've ever sold!")
      expect(page).to have_content("$450")
    end
  end

  context "When valid item details are not provided" do
    let(:item_details) do
      {
        title: "",
        desc: "",
        price: ""
      }
    end

    xscenario "Guest is asked to fix their errors" do
      list_item(item_details)

      expect(page).to have_content("Title can't be blank")
      expect(page).to have_content("Description can't be blank")
      expect(page).to have_content("Price can't be blank")
    end
  end

end
