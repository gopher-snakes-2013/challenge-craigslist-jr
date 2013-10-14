require 'sinatra'
require 'sinatra/activerecord'
require_relative 'models/item'

ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'] || "postgres://localhost/items")

get '/' do
  @items = Item.all
  erb :index
end

post '/' do
  @new_item = Item.create(params)
  redirect '/'
end

get '/edit/:id' do

@item_to_edit = Item.find(params["id"])
erb :edit
end

post '/edit_post/:id' do

  item_to_edit = Item.find(params["id"])
  item_to_edit.title = params[:title]
  item_to_edit.description = params[:description]
  item_to_edit.price = params[:price]
  item_to_edit.save
  redirect '/'
end


