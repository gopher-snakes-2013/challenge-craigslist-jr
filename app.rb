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
  redirect to("/items/#{new_key}")
  
end


get '/items/:item_key' do
  @item = Item.where("item_key = ?", params[:item_key]).first
  erb :item
end