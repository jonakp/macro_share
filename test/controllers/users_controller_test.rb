require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:one)
    @user2 = users(:two)
  end

  test 'should get new' do
    get signup_url
    assert_response :success
  end

  test 'should get edit' do
    log_in_as(@user)
    get edit_user_url(@user)
    assert_response :success
    assert_template 'users/edit'
  end

  test 'Can not access edit by no log-in' do
    get edit_user_url(@user)
    follow_redirect!
    assert_template 'sessions/new'
  end

  test 'Can not access edit by un-correct user' do
    log_in_as(@user2)
    get edit_user_url(@user)
    follow_redirect!
    assert_template 'static_pages/home'
  end
end
