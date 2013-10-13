require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/flash'

require './models/post'


begin 
  require 'dotenv'
  Dotenv.load
rescue LoadError
end

set :database, ENV['DATABASE_URL']

enable :sessions

get '/' do
  @all_postings = Post.all
  erb :index
end

post '/' do
  edit_url = SecureRandom.hex
  new_post = Post.new(title: params["title"], description: params["description"], price: params["price"], edit_url: edit_url)
  if new_post.save
    redirect("/#{new_post.id}/#{new_post.edit_url}")
  else
    flash[:error] = "All fields are required!"
    redirect '/'
  end
end

get '/:id' do
  @posting = Post.find_by(id: params[:id])
  erb :posting
end

get '/:id/:edit_url' do
  @posting = Post.find_by(id: params[:id])
  erb :edit_posting 
end

post '/update/:id' do
  post_id = params[:id]
  posting = Post.find_by(id: post_id)
  posting.update(title: params["title"], description: params["description"], price: params["price"])  
  redirect "/#{post_id}/#{posting.edit_url}"
end