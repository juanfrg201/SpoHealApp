# frozen_string_literal: true

require 'test_helper'

class UserActivitiesControllerTest < ActionDispatch::IntegrationTest
  test 'should get new' do
    get user_activities_new_url
    assert_response :success
  end

  test 'should get create' do
    get user_activities_create_url
    assert_response :success
  end
end
