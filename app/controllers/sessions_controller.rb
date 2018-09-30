class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user&.authenticate(params[:session][:password])
      # login process
      flash[:success] = 'ログインしました'
      log_in user
      redirect_to user
    else
      flash.now[:danger] = 'email もしくは passwordが正しくありません'
      render 'new'
    end
  end

  def destroy
    flash[:success] = 'ログアウトしました'
    log_out
    redirect_to root_url
  end
end
