# frozen_string_literal: true
# 
require 'spec_helper'
require_relative '../models/user'

describe 'Login' do
  before do
    User.create(username: 'Jason', password: 'hello')
  end

  it 'logs in' do
    post '/login', {
      username: 'Jason',
      password: 'hello'
    }

    expect(last_response.status).to eq(302)
    expect(last_response.location).to include('/dashboard')
  end
  it 'fails' do
    post '/login', {
      username: 'Jason',
      password: '123'
    }
    follow_redirect!

    expect(last_response.body).to include('Please check your username and password')
  end
end
