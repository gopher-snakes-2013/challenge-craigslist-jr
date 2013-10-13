require 'sinatra'
require 'sinatra/activerecord'
set :database, ENV['DATABASE_URL'] || "sqlite3:///db/craigslist_jr.db"

enable :sessions

class Item < ActiveRecord::Base

  belongs_to :user
end

class User < ActiveRecord::Base

  has_many :items
end

get '/' do
  @items=Item.all
  erb :index
end

get '/login' do

  erb :login
end

post '/login' do
  user = User.find_by(username: params[:username])
  if user && user.password == params[:password]
    session[:user_id] = user.id
    session[:username] = user.username
    redirect "/user/#{user.id}"
  else
    erb :login
  end
end

post '/signup' do
  user = User.create(username: params[:username], password: params[:password])
  session[:user_id] = user.id
  redirect "/user/#{user.id}"
end

get '/logout' do
  session.clear
  redirect '/'
end

get '/user/:user_id' do
  @user = User.find_by(id: params[:user_id])

  erb :user_view
end

get '/item/new' do

  erb :item_new
end

get '/item/:item_url' do
  @item = find_item_from(params[:item_url])
  erb :item_view
end

post '/item/new' do
  item_url = create_secure_url
  item = Item.new(title: params[:title], price: params[:price], description: params[:desc], url: item_url)
  item.user_id = session[:user_id] if session[:user_id]
  item.save
  redirect "/item/#{item.url}"
end

get '/item/edit/:item_url' do
  @item = find_item_from(params[:item_url])
  erb :item_edit
end

post '/item/update/:item_url' do
  @item = find_item_from(params[:item_url])
  @item.title = params[:title]
  @item.price = params[:price]
  @item.description = params[:desc]
  @item.save

  redirect "/item/#{@item.url}"
end

get '/item/delete/:item_url' do
  item = find_item_from(params[:item_url])
  item.destroy
  redirect "/user/#{session[:user_id]}"
end

helpers do
  def create_secure_url
    require 'securerandom'
    SecureRandom.hex
  end

  def find_item_from(secure_url)
    Item.find_by(url: secure_url)
  end
end