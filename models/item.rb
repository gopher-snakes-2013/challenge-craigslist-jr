class Item < ActiveRecord::Base
  validates :title, :description, :price, :item_key, :presence => true
  validates :item_key, :uniqueness => true
end