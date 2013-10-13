class User < ActiveRecord::Base
  has_many :items

  validates_presence_of :user_name
  validates_presence_of :password
  validates_uniqueness_of :user_name
  validates :password, length: { minimum: 7,
    message: "needs at least 7 characters" }
end