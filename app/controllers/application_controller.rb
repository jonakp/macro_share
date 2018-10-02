class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  def logged_in_user
    return if logged_in?

    flash.now[:danger] = 'ログインしてください'
    redirect_to login_url
  end
end
