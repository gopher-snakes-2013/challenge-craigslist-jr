require 'sinatra'
require 'sinatra/activerecord'
require './environments'
require './models/post'

get '/' do 
  @posts = Post.all
  erb :index
end

post '/post' do 
  Post.create(params)
  redirect '/'
end