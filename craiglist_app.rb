require 'sinatra'
require 'sinatra/activerecord'
# require 'dotenv'

ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'] || "postgres://localhost/cg")
