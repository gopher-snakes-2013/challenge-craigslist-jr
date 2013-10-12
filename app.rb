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
  edit_url = ""
  10.times do
    edit_url << (rand(9) + 1).to_s
  end
  new_post = Post.create(title: params["title"], description: params["description"], price: params["price"], edit_url: edit_url)
  redirect("/#{new_post.id}/#{new_post.edit_url}")
end

get '/:id' do
  @post_id = params[:id]
  @posting = Post.find_by(id: @post_id)
  erb :posting
end

get '/:id/:edit_url' do
  @post_id = params[:id]
  @posting = Post.find_by(id: @post_id)
  erb :edit_posting 
end

post '/update/:id' do
  post_id = params[:id]
  posting = Post.find_by(id: post_id)
  posting.update(title: params["title"], description: params["description"], price: params["price"])  
  redirect "/#{post_id}/#{posting.edit_url}"
end