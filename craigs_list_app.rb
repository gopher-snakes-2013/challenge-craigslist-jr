require 'sinatra'

require 'rack-flash'
enable :sessions
use Rack::Flash

$LOAD_PATH.unshift(File.expand_path('.'))

get '/' do
  erb :index
end
