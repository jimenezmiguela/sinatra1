require 'sqlite3'
require 'sinatra'
require 'sinatra/reloader'

if File.exists?("maindata.db")
  File.delete("maindata.db")
end

db = SQLite3::Database.new("maindata.db")

db.execute <<-SQL
CREATE TABLE users(
  id integer PRIMARY KEY,
  email varchar,
  password varchar);
  SQL

db.execute("INSERT INTO users(email, password) values(?,?);", ["bob@example.com", "pass123"])
db.execute("INSERT INTO users(email, password) values(?,?);", ["john@example.com", "pass123"])
db.execute("INSERT INTO users(email, password) values(?,?);", ["mark@example.com", "pass123"])

get '/' do
  @data_array = db.execute("SELECT * FROM users;")
  erb :results
end

#puts my_array
