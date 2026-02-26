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
DB.execute <<-SQL
  CREATE TABLE IF NOT EXISTS books(
    id INTEGER PRIMARY KEY,
    bookname VARCHAR(50),
    author VARCHAR(50)
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

get ["/dashboard",'/viewall'] do 
  redirect "/login" unless session[:user_id]
  @books = DB.execute 'select * from books'
  erb :dashboard
end

get '/logout' do
  session.clear
  redirect '/login'
end

post '/add_book' do
  DB.execute 'insert into books (bookname,author) values(?,?)', [params[:title], params[:author]]
  redirect '/dashboard'
end

post '/remove_book' do
  DB.execute 'delete from books where bookname = (?)', [params[:title]]
  redirect '/dashboard'
end