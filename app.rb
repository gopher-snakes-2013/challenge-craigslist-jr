require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/flash'
require 'shotgun'
require './models/item'
require './models/user'

begin
  require 'dotenv'
  Dotenv.load
rescue LoadError
end

#set :database, "sqlite3:///craigs.db"

set :database, ENV['DATABASE_URL']

enable :sessions

get '/' do
  @items = Item.all
  @user = User.find_by(id: session[:user_id])
  erb :index
end

post '/' do
  secret_url = SecureRandom.urlsafe_base64
  new_item = Item.new(title: params[:title], price: params[:price], description: params[:description], edit_url: secret_url, user_id: session[:user_id])
  if new_item.save
    redirect '/'
  else
    flash[:error] = "Please fill in all the fields!"
    redirect '/'
  end
end

get '/posts/:id' do
  @item = Item.find_by(id: params[:id])
  erb :post
end

get '/posts/:id/:edit_url' do
  @item = Item.find_by(id: params[:id])
  erb :edit_post
end

post '/posts/update/:id' do
  @item = Item.find_by(id: params[:id])
  @item.update(title: params[:title], price: params[:price], description: params[:description])
  redirect '/'
end

post '/posts/delete/:id' do
  @item = Item.find_by(id: params[:id])
  @item.destroy
  redirect '/'
end

get "/login" do
  erb :login
end

get "/register" do
  erb :new_user
end

post "/new_user" do
  @new_user = User.new(name: params[:name], password: params[:password])
  if @new_user.save
    session[:user_id] = @new_user.id
    redirect "/"
  else
    flash[:register_error] = "Username taken, and/or please fill in all fields"
    redirect "/register"
  end
end

post '/new_session' do
  @user = User.find_by(name: params[:name], password: params[:password])
  if @user.nil?
    flash[:sign_in_error] = "Incorrect Username Password combo"
  else
    session[:user_id] = @user.id
    redirect '/'
  end
end

get '/users/:id' do
  @user = User.find_by(id: session[:user_id])
  @all_items = Item.where(user_id: @user.id)
  erb :user_items
end

get '/logout' do
  session.clear
  redirect '/'
end
