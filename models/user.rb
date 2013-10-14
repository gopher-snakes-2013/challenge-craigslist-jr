class User < ActiveRecord::Base
  validates :name, :password, presence: true
end