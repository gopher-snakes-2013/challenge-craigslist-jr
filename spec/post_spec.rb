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

  it  { should validate_presence_of(:title) }
  it  { should validate_presence_of(:description) }
  it  { should validate_presence_of(:price) }
  it { should belong_to(:user) }

end

describe User do
  let(:user) {User.create(name: "John Doe", password: "secretsauce")}
  it {should validate_presence_of(:name)}
  it {should validate_presence_of(:password_hash)}
end

feature 'Guest visits home page' do 
  let(:post) { Post.create(title: "Example Bike", 
                          description: "This example bike is in good shape.",
                          price: "$30")}
  scenario 'post item for sale' do 
    visit '/'
    fill_in 'title', with: "Example Title"
    fill_in 'description', with: "Example Description"
    fill_in 'price', with: "$30 example"
    click_on 'Post'
  end

end


feature 'Guest may register as User' do
end





















