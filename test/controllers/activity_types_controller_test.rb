require "test_helper"

class ActivityTypesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get activity_types_index_url
    assert_response :success
  end

  test "should get new" do
    get activity_types_new_url
    assert_response :success
  end

  test "should get create" do
    get activity_types_create_url
    assert_response :success
  end

  test "should get destroy" do
    get activity_types_destroy_url
    assert_response :success
  end
end
