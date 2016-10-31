require 'sinatra/base'
require 'json'

# HTTP responses
class Responses
  def self.ok
    [200, { message: 'OK' }.to_json]
  end

  def self.unauthorized
    [401, { message: 'No Autorizado' }.to_json]
  end
end

# WebService2 as a modular Sinatra app for testing proposes
class App < Sinatra::Base
  configure do
    set :bind, '0.0.0.0'
    set :port, 3000
    set :server, :puma
  end

  # Configure logging
  configure :production, :development do
    enable :logging
  end

  get '/' do
    "This is a private service, so you shouldn't be able to see this."
  end

  post '/rest/verify_user/:email?' do |email|
    content_type :json
    Responses.unauthorized if email.nil?

    begin
      _ = JSON.parse(request.body.read)
      # TODO: custom logic
    rescue
      return Responses.unauthorized # TODO: create bad-request response
    end

    # Current temporal validation
    case email
    when 'ignacio@acid.cl'
      Responses.unauthorized
    when 'iverdejo@acid.cl'
      Responses.ok
    else
      Responses.unauthorized
    end
  end
end
