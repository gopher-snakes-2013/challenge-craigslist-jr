require 'sinatra'
require 'sinatra/activerecord'
set :database, ENV['DATABASE_URL'] || "sqlite3:///db/craigslist_jr.db"

class Item < ActiveRecord::Base
end

get '/' do
  @items=Item.all
  erb :index
end

get '/item/new' do
  erb :item_new
end

get '/item/:id' do
  @item = Item.find(params[:id])
  erb :item_view
end

post '/item/new' do
  item = Item.create(title: params[:title], price: params[:price], description: params[:desc])

  redirect "/item/#{item.id}"
end