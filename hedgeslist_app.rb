require 'sinatra/activerecord'
require 'sinatra'

set :database, "sqlite3:///hedges_list.db"

get '/' do
  erb :index
end

get '/post-a-sale' do
  erb :post_a_sale
end

post '/post-a-sale' do
  
end

get '/view-all-listings' do
  erb :all_listings
end
