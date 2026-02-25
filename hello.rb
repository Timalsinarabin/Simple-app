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
  user = DB.execute("Select * from users where username=?",[params[:username]]).first
  if user
    session[:message1] = "The user already exists.Please try another username"
    redirect"/register"
  end
  password = BCrypt::Password.create(params[:password])
  DB.execute("INSERT INTO users(username,password) VALUES (?,?)",[params[:username],password])
  session[:reg_message] = "Registration Sucessful"
  redirect"/login"
end

post '/login' do
  user = DB.execute("Select * from users where username=?",[params[:username]]).first

  if user && BCrypt::Password.new(user["password"])==params[:password]
    session[:user_id] = user["id"]
    session[:username] = user["username"]
    redirect "/dashboard"
  else
    session[:err_message] = "Please check your username and password"
    redirect"/login"
  end  
end

get "/dashboard" do 
  redirect "/login" unless session[:user_id]
  erb :dashboard
end

get '/logout' do
  session.clear
  redirect '/login'
end