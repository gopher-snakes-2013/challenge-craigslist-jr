require 'sinatra'
require 'sinatra/activerecord'
require './environments'
require './models/post'

use Rack::MethodOverride

get '/' do 
  @posts = Post.all
  erb :index
end

get '/post/:id' do
  redirect '/' unless Post.exists?(params[:id])
  @post = Post.find(params[:id])
  erb :post
end

post '/post' do
  Post.create(params)
  @newpost = Post.last
  redirect "/post/#{@newpost.id}"
end

put '/update/:id' do 
  Post.find(params[:id]).update("price" => params[:price])
  Post.find(params[:id]).update("title" => params[:title])
  Post.find(params[:id]).update("description" => params[:description])
  # puts post.price
  # puts params[:price]
  # post.title = params[:title]
  # post.description =  params[:description]
  # post.update(price: params[:price])
  redirect "/post/#{params[:id]}"
end
