require 'sinatra'
require 'sinatra/activerecord'


set :database, ENV['DATABASE_URL'] || "sqlite3:///db/craigslist.db"