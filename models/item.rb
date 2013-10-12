class Item < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :title
  validates_presence_of :description
  validates_presence_of :price
  validates :title, :description, length: { minimum: 2,
    message: "needs at least 2 characters" }
end