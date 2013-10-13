class Item < ActiveRecord::Base
  validates :title, :description, :price, :secure_key, :presence => true
  validates :secure_key, :uniqueness => true
end