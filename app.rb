require 'sinatra'
require 'sinatra/activerecord'
require_relative 'models/item'

set :database, ENV['DATABASE_URL'] || "sqlite3:///db/craigslist.db"

get '/' do
  @items = Item.all
  erb :index
end

post '/new_item' do
  Item.create(title: params[:new_item_title], description: params[:new_item_desc], price: params[:new_item_price])
  redirect to '/'
end