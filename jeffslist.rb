require 'sinatra'
require 'sinatra/activerecord'
require './environments'
require './models/post'
require './models/user'

use Rack::MethodOverride

enable :sessions
set :session_secret, 'a*s32('

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
  params[:user_id] = session[:user]
  Post.create(params)
  @newpost = Post.last
  redirect "/post/#{@newpost.id}"
end

put '/update/:id' do 
  Post.find(params[:id]).update("price" => params[:price])
  Post.find(params[:id]).update("title" => params[:title])
  Post.find(params[:id]).update("description" => params[:description])
  redirect "/post/#{params[:id]}"
end

post '/register' do 
  User.create(params)
  redirect '/'
end

post '/login' do 
  if User.login(params)
    session[:user] = params[:name]
    session[:user_id] = User.find_by_name(params[:name]).id
    redirect "/user/#{params[:name]}" 
  else
    redirect '/'
  end
end

get '/user/:name' do 
  @user = User.find_by_name(params[:name])
  "Hi #{session[:user_id]}"
end
