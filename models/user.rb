class User < ActiveRecord::Base
  has_many :items
  validates :user_name, presence: true, uniqueness: true
  validates :password, presence: true
  validates :password, length: { minimum: 7,
    message: "needs at least 7 characters" }

  def self.authenticate(user_hash)
    user = User.find_by(user_name: user_hash[:user_name])
    return false unless user && user.password == user_hash[:password]
    user
  end
end