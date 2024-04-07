# frozen_string_literal: true

require 'test_helper'

class UserParametrizationsControllerTest < ActionDispatch::IntegrationTest
  test 'should get create' do
    get user_parametrizations_create_url
    assert_response :success
  end

  test 'should get new' do
    get user_parametrizations_new_url
    assert_response :success
  end
end
