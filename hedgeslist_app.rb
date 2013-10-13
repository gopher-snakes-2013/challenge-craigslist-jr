require 'sinatra/activerecord'
require 'sinatra'
require './models/listing'

set :database, "sqlite3:///hedges_list.db"

get '/' do
  erb :index
end

get '/post-a-sale' do
  erb :post_a_sale
end

post '/post-a-sale' do
  Listing.create(title: params[:listing_title], description: params[:listing_description], price: params[:listing_price])
  redirect to '/'
end

get '/view-all-listings' do
  
  @all_listings = Listing.all
  erb :all_listings
end

get '/listing/:id' do
  @current_listing = Listing.find(params[:id])
  erb :listing_post
end
