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
  Item.create(title: params[:new_item_title],
              description: params[:new_item_desc],
              price: params[:new_item_price],
              item_key: SecureRandom.urlsafe_base64 )
  redirect to '/items/:item_key'
  
end


get '/items/:item_key' do
  @item = Items.find_by item_key: :item_key
  erb :item

end