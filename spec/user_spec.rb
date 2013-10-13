require 'spec_helper'

describe User do
  before :each do
    @user = User.create(name: "Steven", password: "password")
  end

  it 'should save in database' do
    expect(@user.name).to eql("Steven")
    expect(@user.password).to eql("password")
    @user.destroy
  end

end