require 'sinatra'

get '/' do
  erb :index
end

get '/post-a-sale' do
  erb :post_a_sale
end

get '/view-all-listings' do
  erb :all_listings
end
