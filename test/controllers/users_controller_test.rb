require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:one)
  end

  test "should get new" do
    get signup_url 
    assert_response :success
  end

  test "should get edit" do
    get edit_user_url(@user)
    assert_response :success
    assert_template 'users/edit'
  end
end
