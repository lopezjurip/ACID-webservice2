require 'minitest/autorun'
require 'rack/test'

require_relative '../app'

# Read 'message' form response's JSON body
def read_message(response)
  JSON.parse(response.body)['message']
end

# App unit tests
class AppTest < Minitest::Test
  include Rack::Test::Methods

  def app
    App # from `../app.rb`
  end

  def test_root
    get '/'
    assert_equal 200, last_response.status
  end

  def test_validation_accept
    email_valid = 'iverdejo@acid.cl'
    data = { image: '' } # TODO: use base64 when real validation is ready

    post "/rest/verify_user/#{email_valid}", data.to_json
    assert_equal 200, last_response.status

    assert_equal read_message(last_response), 'OK'

    post "/rest/verify_user/#{email_valid}" # without JSON
    assert_equal 401, last_response.status
  end

  def test_validation_rejection
    email_invalid = 'ignacio@acid.cl'
    data = { image: '' } # TODO: use base64 when real validation is ready

    post "/rest/verify_user/#{email_invalid}", data.to_json
    assert_equal 401, last_response.status

    assert_equal read_message(last_response), 'No Autorizado'

    post "/rest/verify_user/#{email_invalid}" # without JSON
    assert_equal 401, last_response.status
  end

  def test_empty_post
    post '/rest/verify_user/'
    assert_equal 401, last_response.status
  end
end
