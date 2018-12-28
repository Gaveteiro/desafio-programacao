require 'test_helper'

class MoviesControllerTest < ActionDispatch::IntegrationTest
  test "must get index" do
    get movies_url
    assert_response :success

    #JSON
    get movies_url, params: {
      format: :json
    }
    assert_response :success
  end
end
