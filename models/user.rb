class User < ActiveRecord::Base
  has_many :items
  validates :name, :password, presence: true
end