require 'sinatra'
require 'sinatra/activerecord'
require 'SecureRandom'
require_relative 'models/item'

set :database, ENV['DATABASE_URL'] || "sqlite3:///db/craigslist.db"

get '/' do
  @items = Item.all
  erb :index
end

post '/new_item' do
  new_key = SecureRandom.urlsafe_base64
  @item = Item.create(title: params[:new_item_title],
              description: params[:new_item_desc],
              price: params[:new_item_price],
              item_key: new_key )
  redirect to("/edit_item/#{new_key}")  
end

get '/edit_item/:item_key' do
  @item = Item.find_by item_key: params[:item_key]
  erb :edit_item
end

get '/item/:item_id' do
  @item = Item.find(params[:item_id])
  erb :item
end