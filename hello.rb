require "sinatra"
require "sqlite3"
get ['/','/login'] do
  db = SQLite3::Database.new 'auth.db'
  db.execute <<-SQL
  CREATE TABLE IF NOT EXISTS users(
    id INTEGER PRIMARY KEY,
    username VARCHAR(50),
    password VARCHAR(50)
  )
  SQL
  erb :index;
end
get '/register' do
  erb :register;
end
post '/login' do
  "Hello user"
end
