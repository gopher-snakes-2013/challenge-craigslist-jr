require 'sinatra'
require 'sinatra/activerecord'

ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'] || "postgres://localhost/cg")

# createdb cg first
# then
# rake db:migrate
