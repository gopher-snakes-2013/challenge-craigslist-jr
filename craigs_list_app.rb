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
  flash[:notice] = "You're So Generous!"
  redirect '/'
end

get '/items/list' do
  erb "items/list".to_sym
end

# createdb name
# rake db:migrate

# heroku login
# heroku create "title"
# git push heroku "branch_name"
# heroku run rake db:migrate
# heroku config
# heroku open
