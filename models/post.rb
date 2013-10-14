class Post < ActiveRecord::Base
  validates_presence_of :title, :description, :price
  belongs_to :user
end