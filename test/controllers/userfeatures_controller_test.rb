require 'test_helper'

class UserfeaturesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get userfeatures_new_url
    assert_response :success
  end

end
