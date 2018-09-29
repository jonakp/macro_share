require 'test_helper'

class UserfeatureTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @userfeature = Userfeature.new(
      user_id: User.first.id,
      gender:    'female',
      height:    175,
      weight:    65,
      age:       30,
      activity: 'low',
      purpose:  'loss'
    )
  end

  test 'user_id should be enum number' do
    @userfeature.user_id= ''
    assert_not @userfeature.valid?
  end
  
  test 'purpose should be enum number' do
    @userfeature.purpose= ''
    assert_not @userfeature.valid?
  end

  test 'activity should be enum number' do
    @userfeature.activity = '' 
    assert_not @userfeature.valid?
  end

  test 'age should be more than minimum size' do
    @userfeature.age = -1
    assert_not @userfeature.valid?
  end

  test 'weight should be less than maximum size' do
    @userfeature.weight = 201
    assert_not @userfeature.valid?
  end

  test 'weight should not be nil' do
    @userfeature.weight = "" 
    assert_not @userfeature.valid?
  end

  test 'gender should be enum number' do
    @userfeature.gender = '' 
    assert_not @userfeature.valid?
  end

  test 'height should be less than maximum size' do
    @userfeature.height = 258
    assert_not @userfeature.valid?
  end

  test 'height should be more than minimu size' do
    @userfeature.height = 49
    assert_not @userfeature.valid?
  end

  test 'valid standard info' do
    assert @userfeature.valid?
  end
end
