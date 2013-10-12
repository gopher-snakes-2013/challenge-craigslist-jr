$LOAD_PATH.unshift(File.expand_path('.'))

require 'sinatra'
require 'sinatra/activerecord'
require 'shotgun'
require 'models/item'

begin
require 'dotenv'
Dotenv.load

set :database, ENV['DATABASE_URL']

rescue LoadError
end

get '/' do
  @items = Item.all
  erb :index
end

post "/form" do
  @item = Item.create(title: params["title"], price: params["price"], description: params["description"])
  if @item.valid?
    redirect'/'
  else
    erb :index
  end
end
