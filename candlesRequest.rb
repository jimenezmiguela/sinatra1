require 'sinatra'
require 'sinatra/reloader'

get '/' do
    @name = params[:candles]
    erb :howmany
end
