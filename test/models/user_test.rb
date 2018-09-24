require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new name: 'Test', email: 'test@me.com', password: 'testtest'
  end

  test 'valid user' do
    assert @user.valid?
  end

  test 'name/email should be present' do
    @user.name, @user.email = ' '
    assert_not @user.valid?
  end

  test 'email should be unique' do
    duplicate_user = @user.dup
    @user.save
    assert_not duplicate_user.valid?
  end

  test 'invalid name length' do
    @user.name = 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa'
    assert_not @user.valid?
  end

  test 'invalid email length' do
    @user.email = 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
    aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
    aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
    aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
    aaaaaaaaaaaaa'
    assert_not @user.valid?
  end

  test 'password should be present' do
    @user.password = @user.password_confirmation = ' ' * 6
    assert_not @user.valid?
  end

  test 'password should be less than minimum size' do
    @user.password = @user.password_confirmation = 'a' * 5
    assert_not @user.valid?
  end

  test 'height should be less than maximum size' do
    @user.height = 258 
    assert_not @user.valid?
  end

  test 'height should be more than minimu size' do
    @user.height = 49 
    assert_not @user.valid?
  end

  test 'valid standard info' do
    @user.gender = 'female'
    @user.height = 175
    @user.weight = 65
    @user.age = 30
    @user.activity = 'low'
    @user.purpose = 'loss'
    assert @user.valid?
  end
end
