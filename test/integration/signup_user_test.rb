require 'test_helper'

class SignupUserTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user = users(:one)
  end

  test 'succeed to signup' do
    get signup_path
    assert_template 'users/new'
    assert_difference 'User.count', 1 do
      post users_path, params: { user: { name: 'Test',
                                         email: 'test@me.com',
                                         password: 'testtest',
                                         password_confirmation: 'testtest' } }
    end
    follow_redirect!
    assert_template 'users/show'
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end

  test 'failed to signup' do
    get signup_path
    assert_template 'users/new'
    assert_difference 'User.count', 0 do
      post users_path, params: { user: { name: '',
                                         email: 'test@me.com',
                                         password: 'tes',
                                         password_confirmation: 'testtest' } }
    end
    assert_template 'users/new'
    assert_match 'alert-danger', response.body
  end

  test 'succeed user info update' do
    log_in_as(@user)
    get edit_user_path(@user)
    assert_template 'users/edit'
    before_name = @user.name
    patch user_path(@user),
          params: { user: { name: 'oneone',
                            email: 'mystring1@me.com',
                            password: 'testtest',
                            password_confirmation: 'testtest' } }
    follow_redirect!
    assert_template 'sessions/new'
    @user.reload
    assert_not_equal before_name, @user.name
  end

  test 'failed user info update' do
    log_in_as(@user)
    get edit_user_path(@user)
    assert_template 'users/edit'
    before_name = @user.name
    patch user_path(@user),
          params: { user: { name: 'oneone',
                            email: 'mystring1@me.com',
                            password: 'testtest',
                            password_confirmation: 'test' } }
    assert_template 'users/edit'
    @user.reload
    assert_equal before_name, @user.name
  end
end
