$LOAD_PATH.unshift(File.expand_path('.'))

require 'sinatra'
require 'sinatra/activerecord'
require 'shotgun'
require 'models/item'
require 'models/user'

begin
  require 'dotenv'
  Dotenv.load
rescue LoadError
end

set :database, ENV['DATABASE_URL']

##

enable :sessions

require 'helpers/session_helper'

helpers do
  include SessionHelper
end

##

get '/' do
  @items = Item.all
  erb :index
end

get '/user' do
  @items = Item.all
  @user_items = current_user.items
  @user_id = session[:user_id]
  erb :user
end

get '/logout' do
  log_out
  redirect '/'
end

post '/new_listing' do
  @items = Item.all
  @item = Item.create(title: params[:title],
    description: params[:description],
    price: params[:price], user_id: params[:user_id])
  session[:item] = @item
  redirect '/user'
end

post '/edit' do
  redirect "/edit/#{params[:item_id]}"
end

post '/cancel' do
  redirect "/user"
end

get '/edit/:id' do
  @items = Item.all
  @user_items = current_user.items
  @user_id = session[:user_id]
  session[:item] = Item.find(params[:id])
  @item = session[:item]
  erb :edit
end

post '/edited' do
  @item = session[:item]
  @item.title = params[:title]
  @item.description = params[:description]
  @item.price = params[:price]
  @item.save
  redirect '/user'
end

post '/login' do
  @user = User.authenticate(params[:user])
  if @user
    login(@user)
    redirect '/user'
  else
    redirect '/'
  end
end

post '/signup' do
  @user = User.create(params[:user])
  if @user.valid?
    login(@user)
    redirect '/user'
  else
    redirect '/'
  end
end

post '/delete' do
  @item = Item.find(params[:item_id])
  @item.destroy
  redirect '/user'
end

