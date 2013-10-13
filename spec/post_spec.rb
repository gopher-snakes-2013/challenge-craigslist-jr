require 'spec_helper'

describe Post do

  before :each do
    @posting = Post.create(title: 'iPad', description: 'White 16GB iPad 2', price: '200', user_id: 5)
  end
  
  it 'should save in posts' do
    expect(@posting.title).to eql('iPad')
    expect(@posting.description).to eql('White 16GB iPad 2')
    expect(@posting.price).to eql('200')
    expect(@posting.user_id).to eql(5)
  end

  after :each do
    @posting.destroy
  end
end