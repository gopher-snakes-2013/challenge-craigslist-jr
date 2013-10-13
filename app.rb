require 'sinatra'
require 'sinatra/activerecord'
require_relative 'models/item'

set :database, ENV['DATABASE_URL'] || "sqlite3:///db/craigslist.db"

get '/' do
  @items = Item.all
  erb :index
end