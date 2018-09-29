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

end
