require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/flash'

require './models/post'
require './models/user'


begin 
  require 'dotenv'
  Dotenv.load
rescue LoadError
end

set :database, ENV['DATABASE_URL']

enable :sessions

get '/' do
  @all_postings = Post.all
  @user = User.find_by(id: session[:user_id])
  erb :index
end

post '/' do
  edit_url = SecureRandom.hex
  new_post = Post.new(title: params["title"], description: params["description"], price: params["price"], edit_url: edit_url, user_id: session[:user_id])
  if new_post.save
    redirect("/posts/#{new_post.id}/#{new_post.edit_url}")
  else
    flash[:error] = "All fields are required!"
    redirect('/')
  end
end

get '/posts/:id' do
  @posting = Post.find_by(id: params[:id])
  erb :posting
end

get '/posts/:id/:edit_url' do
  @posting = Post.find_by(id: params[:id])
  erb :edit_posting 
end

post '/posts/update/:id' do
  post_id = params[:id]
  posting = Post.find_by(id: post_id)
  posting.update(title: params["title"], description: params["description"], price: params["price"])  
  redirect("/posts/#{post_id}/#{posting.edit_url}")
end

get '/sign_up' do
  erb :sign_up
end

post '/sign_up' do
  new_user = User.new(name: params["sign_up_username"], password: params["sign_up_password"])
  if new_user.save
    session[:user_id] = new_user.id
    redirect("/")
  else
    flash[:error] = "All fields are required!"
    redirect('/sign_up')
  end
end

post '/sign_in' do
  if current_user = User.find_by(name: params["sign_in_username"])
    session[:user_id] = current_user.id
    redirect('/')
  else
    flash[:sign_in_error] = "That Username/Password combination doesn't exist. Please try again."
    redirect('/')
  end
end

get '/users/:id' do
  @user = User.find_by(id: session[:user_id])
  @user_postings = Post.find_by(user_id: @user.id)
  erb :profile
end

post '/posts/delete/:id' do
  post = Post.find_by(id: params[:id])
  post.destroy
  redirect("/users/#{session[:user_id]}")
end