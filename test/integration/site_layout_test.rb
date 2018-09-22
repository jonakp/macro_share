require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest

  test "top layout" do
    get root_path 
    assert_select "a[href=?]", signup_url, count: 1
  end
end
