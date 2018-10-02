require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:one)
  end

  test 'should get new' do
    get login_path 
    assert_response :success
  end

  test 'should not destroy session' do
    delete login_path
    follow_redirect!
    assert_template 'sessions/new'
  end
end
