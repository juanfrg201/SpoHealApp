# frozen_string_literal: true

require 'test_helper'

class NutricionTipsControllerTest < ActionDispatch::IntegrationTest
  test 'should get create' do
    get nutricion_tips_create_url
    assert_response :success
  end

  test 'should get show' do
    get nutricion_tips_show_url
    assert_response :success
  end
end
