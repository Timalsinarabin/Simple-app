# frozen_string_literal: true

require 'sinatra'
require 'sinatra/activerecord'
require 'sqlite3'
require 'bcrypt'
require './models/user'
require './models/library'

enable :sessions

set :database, { adapter: 'sqlite3', database: 'db/development.sqlite3' }

# Login and Registration

get ['/', '/login'] do
  erb :index
end

get '/register' do
  erb :register
end

post '/register' do
  if User.find_by(username: params[:username])
    session[:message1] = 'User already exists'
    redirect '/register'
  end

  user = User.new(
    username: params[:username],
    password: params[:password]
  )
  if user.save
    session[:user_id] = user.id
    redirect '/dashboard'
  else
    session[:message1] = 'Registration failed'
    redirect '/register'
  end
end

post '/login' do
  user = User.find_by(username: params[:username])

  if user&.authenticate(params[:password])
    session[:user_id] = user.id
    session[:username] = user.username
    redirect '/dashboard'
  else
    session[:err_message] = 'Please check your username and password'
    redirect '/login'
  end
end

# Library

get ['/dashboard', '/viewall'] do
  redirect '/login' unless session[:user_id]
  per_page = 4
  page = (params[:page] || 1).to_i
  offset = (page - 1) * per_page
  @books = Library.limit(per_page).offset(offset)
  total_books = Library.count
  @total_pages = (total_books / per_page.to_f).ceil
  @current_page = page
  erb :dashboard
end

get '/logout' do
  session.clear
  redirect '/login'
end

post '/add_book' do
  book = Library.new(
    bookname: params[:bookname],
    author: params[:author]
  )
  if book.save
    session[:sucessMessage] = 'Book added sucessfully'
  else
    session[:errorMessage] = 'Failed to add book'
  end
  redirect '/dashboard'
end

post '/remove_book' do
  book = Library.find_by(bookname: params[:bookname])
  if book
    book.destroy
    session[:sucessMessage] = 'Book removed sucessfully'
  else
    session[:errorMessage] = 'Falied to remove book'
  end
  redirect '/dashboard'
end
