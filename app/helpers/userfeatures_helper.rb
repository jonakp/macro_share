module UserfeaturesHelper
  def current_user
    # ログイン機能作成後要修正
    User.first
  end
end
