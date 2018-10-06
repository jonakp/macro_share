class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  def logged_in_user
    return if logged_in?

    flash.now[:danger] = 'ログインしてください'
    redirect_to login_url
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless @user == current_user
  end
  
  def correct_user_from_userfeature
    @userfeature = Userfeature.find(params[:id])
    redirect_to(root_url) unless @userfeature.user == current_user
  end
end
