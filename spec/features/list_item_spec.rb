require 'spec_helper'

feature "Post a listing" do
  before :each do
    visit('/')
    fill_in('title', with: 'iPad' )
    fill_in('description', with: 'White 16GB iPad 2. Wifi with Orange cover')
    fill_in('price', with: '200')
    click_button('Post Listing')
    @post = Post.last
  end

  scenario "should allow you to post product" do
    expect(page).to have_content('iPad')
  end

  scenario "should update index with link to post" do
    expect(page).to have_content("iPad")
  end
  

  after :each do
    @post.destroy
  end

end

