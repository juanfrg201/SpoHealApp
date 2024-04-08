require "test_helper"

class ActivityRecomendationsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get activity_recomendations_index_url
    assert_response :success
  end
end
