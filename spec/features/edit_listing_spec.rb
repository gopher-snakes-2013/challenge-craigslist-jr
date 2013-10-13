require 'spec_helper'

feature "Edit a listing" do
  before :each do
    visit('/')
    fill_in('title', with: 'iPad')
    fill_in('description', with: 'White 16GB iPad 2. Wifi with Orange cover')
    fill_in('price', with: '200')
    click_button('Post Listing')
    @post = Post.last
    visit("/posts/#{@post.id}/#{@post.edit_url}")
  end

  scenario "should allow user to edit listing" do
    fill_in('title', with: 'iPad 2')
    fill_in('description', with: 'White 16GB iPad 2. Wifi with Blue cover')
    fill_in('price', with: '190')
    click_button('Update Listing')
    expect(page).to have_content("iPad 2")
    expect(page).to have_content("White 16GB iPad 2. Wifi with Blue cover")
    expect(page).to have_content("190")
  end

  after :each do
    @post.destroy
  end

end
