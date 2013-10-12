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



















