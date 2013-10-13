require 'bcrypt'

class User < ActiveRecord::Base
  include BCrypt
  validates_presence_of :name, :password_hash

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def create
    @user = User.new(params[:user])
    @user.password = params[:password]
    @user.save!
  end

  def self.login(params)
    return false unless User.exists?(name: params[:name])
    @user = User.find_by_name(params[:name])
    @user.password == params[:password]
  end
end