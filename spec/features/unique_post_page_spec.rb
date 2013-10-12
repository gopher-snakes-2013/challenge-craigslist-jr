require 'spec_helper'

feature "Unique page for listing" do
  before :each do
    visit('/')
    fill_in('title', with: 'iPad' )
    fill_in('description', with: 'White 16GB iPad 2. Wifi with Orange cover')
    fill_in('price', with: '200')
    click_button('Post Listing')
    @post = Post.last
  end

  scenario "should create unique page for listing" do
    expect(page).to have_content("iPad")
    expect(page).to have_content("White 16GB iPad 2. Wifi with Orange cover")
    expect(page).to have_content("200")
  end

  after :each do
    @post.destroy
  end

end

