require 'sinatra'
require 'sinatra/activerecord'
require_relative 'models/item'
require_relative 'models/user'

ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'] || "postgres://localhost/cg")

# createdb cg first
# then
# rake db:migrate

get '/' do
  erb :index
end

post '/display/posts' do
  @new_item = Item.create(params)
  erb :item_listing
  # "yo charles"
end
