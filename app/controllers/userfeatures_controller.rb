class UserfeaturesController < ApplicationController
  before_action :logged_in_user
  before_action :correct_user_from_userfeature, only: %i[edit update]

  def new
    @userfeature = Userfeature.new
  end

  def create
    @userfeature = Userfeature.new(userfeature_params)
    if @userfeature.valid?
      culculate_calorie_macro(@userfeature)
      @userfeature.save
      flash[:success] = '基本情報を登録しました'
      redirect_to @userfeature.user
    else
      render 'userfeatures/new'
    end
  end

  def edit
    @userfeature = current_user.userfeature
  end

  def update
    @userfeature = current_user.userfeature
    @userfeature.attributes = userfeature_params
    if @userfeature.valid?
      culculate_calorie_macro(@userfeature)
      @userfeature.save
      flash[:success] = '基本情報を更新しました'
      redirect_to @userfeature.user
    else
      render 'edit'
    end
  end

  private

  def userfeature_params
    params.require(:userfeature).permit(:user_id, :gender, :height, :weight,
                                        :age, :activity, :purpose)
  end

  def culculate_calorie_macro(feature)
    culculate_calorie(feature)
    culculate_macro(feature)
  end

  def culculate_calorie(feature)
    gender_num = feature.gender == 'male' ? 5 : -161
    activity_val = activity_value(feature.activity)
    purpose_val =  purpose_value(feature.purpose)
    basic_calorie = (10 * feature.weight) + (6.25 * feature.height) -
                    (5 * feature.age) + gender_num
    feature.total_calorie = basic_calorie * activity_val * purpose_val
  end

  def culculate_macro(feature)
    feature.protein = feature.weight * 2
    feature.fat = feature.total_calorie / (4 * 9)
    feature.carbo = (feature.total_calorie -
                     (feature.protein * 4) - (feature.fat * 9)) / 4
  end

  def activity_value(activity)
    case activity
    when 'low' then 1.2
    when 'middle' then 1.55
    when 'high' then 1.725
    else 1.2
    end
  end

  def purpose_value(purpose)
    case purpose
    when 'loss' then 0.8
    when 'maintain' then 1
    when 'increase' then 1.2
    else 1.2
    end
  end
end
