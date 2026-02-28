# frozen_string_literal: true

require 'rack/test'
require 'rspec'

ENV['Rack_ENV'] = 'test'

require_relative '../app'

RSpec.configure do |config|
  config.include Rack::Test::Methods
end

def app
  Sinatra::Application
end
