require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  def setup
    @user = users(:one)
  end

  test 'login failed' do
    get login_path
    assert_template 'sessions/new'
    post login_path, params: { session: { email: '', password: '' } }
    assert_template 'sessions/new'
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end

  test 'login succeed and logout' do
    get login_path
    assert_template 'sessions/new'
    post login_path, params: { session: { email: @user.email,
                                          password: 'password' } }
    follow_redirect!
    assert_template 'users/show'
    assert is_logged_in?
    assert_match user_url, response.body
    delete login_path
    follow_redirect!
    assert_not is_logged_in?
    assert_match login_url, response.body
  end
end
