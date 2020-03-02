require 'sinatra'
enable :sessions

get '/getdoc' do
 "<!DOCTYPE html>
<html>
<head>
<style>
body {
  background-color: purple;
}

h1 {
  color: yellow;
}
</style>
</head>
<body>

<h1>Zup World!</h1>

</body>
</html> "
end

get '/' do
  "Hello World"
end

 post "/logon" do
  if params[:username] == "bob" && params[:password] == "pass"
      "SUCCESS"
  else
      "FAILURE"
  end
  end

 post "/hello" do
  session[:name] = params[:name]
    "session saved"
   end
 
 get "/greet" do 
  "Good evening #{session[:name]}"
 end
 
get "/howmany" do
erb :howmany
end
   
post "/candles" do
@cndle = params[:candles].to_i
erb :candles

end 
   
   
   
   