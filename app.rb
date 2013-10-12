require 'sinatra'
require 'sinatra/activerecord'
set :database, ENV['DATABASE_URL'] || "sqlite3:///db/craigslist_jr.db"


get '/' do
  erb :index
end