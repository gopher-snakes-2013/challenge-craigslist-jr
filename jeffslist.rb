require 'sinatra'
require 'sinatra/activerecord'
require './environments'
require './models/post'

get '/' do 
  "Welcome to Jeff's List"
end