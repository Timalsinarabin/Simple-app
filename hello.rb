require "sinatra"
require "sqlite3"
require "bcrypt"

enable :sessions

DB = SQLite3::Database.new 'auth.db'
DB.results_as_hash = true
DB.execute <<-SQL
  CREATE TABLE IF NOT EXISTS users(
    id INTEGER PRIMARY KEY,
    username VARCHAR(50),
    password VARCHAR(100)
  )
SQL
get ['/','/login'] do
  erb :index;
end

get '/register' do
  erb :register;
end

post '/register' do
  password = BCrypt::Password.create(params[:password])
  DB.execute("INSERT INTO users(username,password) VALUES (?,?)",[params[:username],password])
  session[:message] = "Registration Sucessful"
  redirect"/login"
end
post '/login' do
  user = DB.execute("Select * from users where username=?",[params[:username]]).first

  if user && BCrypt::Password.new(user["password"])==params[:password]
    "Login Sucessful, Hello #{params[:username]}"
  else
    "login falied. Please check your username and password"
  end  
end