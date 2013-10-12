require 'sinatra'
require 'sinatra/activerecord'

require './models/post'


begin 
  require 'dotenv'
  Dotenv.load
rescue LoadError
end

set :database, ENV['DATABASE_URL']

get '/' do
  @all_postings = Post.all
  erb :index
end

post '/' do
  Post.create(title: params["title"], description: params["description"], price: params["price"])
  redirect('/')
end

get '/:id' do
  @post_id = params[:id]
  @posting = Post.find_by(id: @post_id)
  erb :posting
end