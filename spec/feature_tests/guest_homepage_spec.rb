require 'spec_helper'

feature "guest visits the homepace" do
  scenario "they see HegesList" do
    visit "/"
    expect(page).to have_content "HedgesList"
  end
  scenario "they see some content" do
    visit "/"
    expect(page).to have_content "A place where you can sell all the things!"
  end

end
