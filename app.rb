$LOAD_PATH.unshift(File.expand_path('.'))

require 'sinatra'
require 'sinatra/activerecord'
require 'shotgun'
require 'models/item'
require 'models/user'

begin
  require 'dotenv'
  Dotenv.load
rescue LoadError
end

set :database, ENV['DATABASE_URL']

get '/' do
  @items = Item.all
  erb :index
end

post '/listing' do
  @items = Item.all
  @item = Item.create(title: params[:title],
    description: params[:description],
    price: params[:price])
  erb :item_link
end

get '/item/:id' do
  @item_to_edit = Item.find(params[:id])
  erb :edit
end

post '/edit' do
  @item_to_edit = Item.find(params[:id])
  @item_to_edit.title = params[:title]
  @item_to_edit.description = params[:description]
  @item_to_edit.price = params[:price]
  @item_to_edit.save
  redirect '/'
end