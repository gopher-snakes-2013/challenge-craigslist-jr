require 'sinatra'
require 'sinatra/activerecord'
set :database, ENV['DATABASE_URL'] || "sqlite3:///db/craigslist_jr.db"

class Item < ActiveRecord::Base
end

get '/' do
  erb :index
end