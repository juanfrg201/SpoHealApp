# frozen_string_literal: true

require 'test_helper'

class UserRoutesControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get user_routes_index_url
    assert_response :success
  end

  test 'should get new' do
    get user_routes_new_url
    assert_response :success
  end

  test 'should get create' do
    get user_routes_create_url
    assert_response :success
  end
end
