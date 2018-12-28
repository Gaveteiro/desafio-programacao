require 'test_helper'

class GenresControllerTest < ActionDispatch::IntegrationTest
  test "must get index" do
    get genres_path, params: { format: :json }
    assert_response :success
  end
end
