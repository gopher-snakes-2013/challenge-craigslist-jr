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
  params[:user_id] = session[:user_id]
  Post.create(params)
  @newpost = Post.last
  redirect "/user/#{session[:name]}" if session[:user_id]
  redirect "/post/#{@newpost.id}"
end




put '/update/:id' do 
  Post.find(params[:id]).update("price" => params[:price])
  Post.find(params[:id]).update("title" => params[:title])
  Post.find(params[:id]).update("description" => params[:description])
  redirect "/post/#{params[:id]}"
end

delete '/delete/:id' do 
  Post.destroy(params[:id])
  redirect "/user/#{session[:name]}"
end

post '/register' do 
  user = User.create(params)
  session[:user_id] = user.id
  session[:name] = params[:name]
  redirect "/user/#{params[:name]}" 
end

post '/login' do 
  if User.login(params)
    session[:name] = params[:name]
    session[:user_id] = User.find_by_name(params[:name]).id
    redirect "/user/#{params[:name]}" 
  else
    redirect '/'
  end
end

get '/user/:name' do 
  @user = User.find_by_name(params[:name])
  @posts = Post.where("user_id = ?", session[:user_id])
  erb :user
end

post '/logout' do 
  session[:user_id] = nil
  session[:name] = nil
  redirect '/'
end