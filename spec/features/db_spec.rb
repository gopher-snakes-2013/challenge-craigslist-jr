require 'spec_helper'

describe Item do
  context "checking validations" do
    it { should belong_to :user }
    it { should validate_presence_of :title }
    it { should validate_presence_of :description }
    it { should validate_presence_of :price }
    it { should_not allow_value("*"*1).for :title }
    it { should_not allow_value("*"*1).for :description }
  end
end

describe User do
  context "checking validations" do
    it { should have_many :items }
    it { should validate_presence_of :user_name }
    it { should validate_presence_of :password }
    it { should validate_uniqueness_of :user_name }
    it { should_not allow_value("*"*6).for :password }
  end
end