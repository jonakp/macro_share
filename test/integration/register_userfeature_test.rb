require 'test_helper'

class RegisterUserfeatureTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:one)
    @user3 = users(:three)
  end

  test 'succeed to register userfeature' do
    log_in_as(@user3)
    get new_userfeature_path
    assert_template 'userfeatures/new'
    assert_difference 'Userfeature.count', 1 do
      post userfeatures_path, params: { userfeature: { user_id:  @user3.id,
                                                       gender:   'female',
                                                       height:   158,
                                                       weight:   52,
                                                       age:      30,
                                                       activity: 'high',
                                                       purpose:  'maintain' } }
    end
    follow_redirect!
    assert_template 'users/show'
    assert_match @user3.userfeature.total_calorie.to_s, response.body
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end

  test 'failed to register userfeature' do
    log_in_as(@user3)
    get new_userfeature_path
    assert_template 'userfeatures/new'
    assert_difference 'Userfeature.count', 0 do
      post userfeatures_path, params: { userfeature: { user_id:  ' ',
                                                       gender:   ' ',
                                                       height:   300,
                                                       weight:   -1,
                                                       age:      2002,
                                                       activity: ' ',
                                                       purpose:  ' ' } }
    end
    assert_template 'userfeatures/new'
    assert_match 'alert-danger', response.body
  end

  test 'update userfeature' do
    log_in_as(@user)
    post userfeatures_path,
         params: { userfeature: { user_id: @user.id,   gender:   'female',
                                  height:  158,        weight:   52,
                                  age:      30,        activity: 'high',
                                  purpose:  'maintain' } }
    before_calorie = @user.userfeature.total_calorie
    get edit_userfeature_path(@user.userfeature)
    assert_template 'userfeatures/edit'
    assert_difference 'Userfeature.count', 0 do
      patch userfeature_path(@user.userfeature.id),
            params: { userfeature: { user_id:  @user.id,  gender:   'male',
                                     height:   158,       weight:   52,
                                     age:      30,        activity: 'high',
                                     purpose:  'maintain' } }
    end
    follow_redirect!
    assert_template 'users/show'
    @user.reload
    assert_match @user.userfeature.total_calorie.to_s, response.body
    assert_equal @user.userfeature.gender, 'male'
    assert_not_equal before_calorie, @user.userfeature.total_calorie
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end

  test 'failed update userfeature' do
    log_in_as(@user)
    post userfeatures_path, params: { userfeature: { user_id:  @user.id,
                                                     gender:   'female',
                                                     height:   158,
                                                     weight:   52,
                                                     age:      30,
                                                     activity: 'high',
                                                     purpose:  'maintain' } }
    get edit_userfeature_path(@user.userfeature.id)
    assert_template 'userfeatures/edit'
    assert_difference 'Userfeature.count', 0 do
      patch userfeature_path(@user.userfeature.id),
            params: { userfeature: { user_id:  @user.id,
                                     gender:   '',
                                     height:   '',
                                     weight:   '',
                                     age:      '',
                                     activity: '',
                                     purpose:  '' } }
    end
    assert_template 'userfeatures/edit'
    assert_match 'alert-danger', response.body
  end
end
