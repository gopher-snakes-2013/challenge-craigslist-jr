require 'spec_helper'

describe Post do 
  let(:post) { Post.create(title: "Example Bike", 
                          description: "This example bike is in good shape.",
                          price: "$30")}
  it "has to have a title, description and price" do
    expect(post.title).to eql "Example Bike"
    expect(post.description).to eql "This example bike is in good shape."
    expect(post.price).to eql "$30"
  end
end

feature 'Guest visits home page' do 
  scenario 'post item for sale' do 
    visit '/'
    fill_in 'Title', with: "Example Title"
    fill_in 'Description', with: "Example Desciption"
    fill_in 'Price', with: "$30 example"
    click_button 'Post'
  end

end



















