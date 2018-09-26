require 'test_helper'

class RegisterUserfeatureTest < ActionDispatch::IntegrationTest
  test 'succeed to register userfeature' do
    get new_userfeature_path
    assert_template 'userfeatures/new'
    assert_difference 'Userfeature.count', 1 do
      post userfeatures_path, params: { userfeature: { user_id:  User.first.id,
                                                       gender:   'female',
                                                       height:   158,
                                                       weight:   52,
                                                       age:      30,
                                                       activity: 'high',
                                                       purpose:  'maintain' } }
    end
    follow_redirect!
    assert_template 'users/show'
    assert_match User.first.userfeature.total_calorie.to_s, response.body
  end

  test 'failed to register userfeature' do
    get new_userfeature_path
    assert_template 'userfeatures/new'
    assert_difference 'Userfeature.count', 0 do
      post userfeatures_path, params: { userfeature: { user_id:  ' ', 
                                                       gender:   ' ',
                                                       height:   300,
                                                       weight:   -1,
                                                       age:      200200,
                                                       activity: ' ',
                                                       purpose:  ' ' } }
    end
    assert_template 'userfeatures/new'
  end
  
  test 'update userfeature' do
    post userfeatures_path, params: { userfeature: { user_id:  User.first.id,
                                                     gender:   'female',
                                                     height:   158,
                                                     weight:   52,
                                                     age:      30,
                                                     activity: 'high',
                                                     purpose:  'maintain' } }
    before_calorie = User.first.userfeature.total_calorie
    get edit_userfeature_path(User.first.userfeature.id)
    assert_template 'userfeatures/edit'
    assert_difference 'Userfeature.count', 0 do
      patch userfeature_path(User.first.userfeature.id), params: { userfeature: { 
                                                       user_id:  User.first.id,
                                                       gender:   'male',
                                                       height:   158,
                                                       weight:   52,
                                                       age:      30,
                                                       activity: 'high',
                                                       purpose:  'maintain' } }
    end
    follow_redirect!
    assert_template 'users/show'
    assert_match User.first.userfeature.total_calorie.to_s, response.body
    assert_equal User.first.userfeature.gender, 'male'
    assert_not_equal before_calorie, User.first.userfeature.total_calorie
  end
end
