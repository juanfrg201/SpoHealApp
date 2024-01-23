require "test_helper"

class CommunityControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get community_index_url
    assert_response :success
  end

  test "should get show" do
    get community_show_url
    assert_response :success
  end

  test "should get new" do
    get community_new_url
    assert_response :success
  end

  test "should get create" do
    get community_create_url
    assert_response :success
  end

  test "should get destroy" do
    get community_destroy_url
    assert_response :success
  end
end
