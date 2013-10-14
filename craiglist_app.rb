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
  # @new_item = Item.create(params)
  # "display url to edit item here!"
  # redirect '/show/edit/post/#{}'
  erb :edit_item_post
end

post '/display/items' do
  "display posts here!"
  erb :items_list
end
