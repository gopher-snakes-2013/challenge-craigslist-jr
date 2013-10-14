require 'sinatra'

require 'rack-flash'

#ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'] || "postgres://localhost/craig")

enable :sessions
use Rack::Flash

$LOAD_PATH.unshift(File.expand_path('.'))

get '/' do
  erb :index
end

get '/items/new' do
  erb "items/new".to_sym
end

post '/items/new' do
  flash[:notice] = "Hopefully Someone Else Wants This!"
  redirect '/'
end

get '/items/list' do
  erb "items/list".to_sym
end
