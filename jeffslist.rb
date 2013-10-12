require 'sinatra'
require 'sinatra/activerecord'
require './environments'
require './models/post'

get '/' do 
 erb :index
end