class User < ActiveRecord::Base
  has_many :posts
  validates :posts, presence: true
  validates :emails, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password, presence: true
  validates :username, presence: true
end

