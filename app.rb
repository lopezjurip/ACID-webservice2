require 'sinatra/base'

# WebService2 as a modular Sinatra app for testing proposes
class App < Sinatra::Base
  # Set webserver
  configure { set :server, :puma }

  # Configure logging
  configure :production, :development do
    enable :logging
  end

  get '/' do
    'Hello world!'
  end
end
