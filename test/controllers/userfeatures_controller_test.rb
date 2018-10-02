require 'test_helper'

class UserfeaturesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:one) 
  end

  test "should get new" do
    log_in_as(@user)
    get new_userfeature_path
    assert_response :success
  end

  test "should not get new" do
    get new_userfeature_path
    follow_redirect!
    assert_template 'sessions/new'
  end

  test "should not get edit" do
    get edit_userfeature_path(@user)
    follow_redirect!
    assert_template 'sessions/new'
  end
end
