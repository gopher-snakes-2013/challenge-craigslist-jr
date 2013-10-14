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

#set :database, ENV['DATABASE_URL']
set :database, "sqlite3:///craigs.db"
enable :sessions

get '/' do
  @items = Item.all
  erb :index
end

post '/' do
  secret_url = SecureRandom.urlsafe_base64
  new_item = Item.new(title: params[:title], price: params[:price], description: params[:description], edit_url: secret_url)
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


