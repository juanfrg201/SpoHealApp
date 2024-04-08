require "test_helper"

class UserStadisticsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_stadistics_index_url
    assert_response :success
  end
end
