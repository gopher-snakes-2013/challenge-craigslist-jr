require 'sinatra'
require 'sinatra/activerecord'
# require 'SecureRandom'
require_relative 'models/item'
require_relative 'models/user'

ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'] || "postgres://localhost/cg")

# createdb cg first
# then
# rake db:migrate

get '/' do
  erb :index
end

post '/create/post' do
  random_url = SecureRandom.urlsafe_base64
  @new_item = Item.create(title: params[:title], description: params[:description], price: params[:price], item_url: random_url)
  redirect "/show/post/#{@new_item[:item_url]}"
end

post '/display/items' do
  "display posts here!"
  erb :items_list
end


get '/show/post/:random_url' do
  @secret_url = params[:random_url]
  @current_item = Item.find_by item_url: "#{@secret_url}"
  erb :show_post
end

get '/edit/item/:item_url' do
  @edit_item = Item.find_by item_url: "#{params[:item_url]}"
  erb :edit_post
end

post '/update/post/:item_url' do
  @current_item = Item.find_by item_url: "#{params[:item_url]}"
  @current_item.title = params[:updated_title]
  @current_item.description = params[:updated_description]
  @current_item.price = params[:updated_price]
  @current_item.save
  erb :show_post
end

post '/update/title/:item_url' do
  @current_item = Item.find_by item_url: "#{params[:item_url]}"
  @current_item.title = params[:updated_title]
  @current_item.save
  erb :show_post
end

post '/update/description/:item_url' do
  @current_item = Item.find_by item_url: "#{params[:item_url]}"
  @current_item.description = params[:updated_description]
  @current_item.save
  erb :show_post
end

post '/update/price/:item_url' do
  @current_item = Item.find_by item_url: "#{params[:item_url]}"
  @current_item.price = params[:updated_price]
  @current_item.save
  erb :show_post
end
