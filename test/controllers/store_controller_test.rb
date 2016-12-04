require 'test_helper'

class StoreControllerTest < ActionDispatch::IntegrationTest
  test 'should get home' do
    get store_home_url
    assert_response :success
  end

  test 'should get about_us' do
    get store_about_us_url
    assert_response :success
  end

  test 'should get FAQ' do
    get store_FAQ_url
    assert_response :success
  end

  test 'should get search' do
    get store_search_url
    assert_response :success
  end

  test 'should get contact' do
    get store_contact_url
    assert_response :success
  end
end
