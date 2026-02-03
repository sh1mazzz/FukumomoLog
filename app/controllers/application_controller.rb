class ApplicationController < ActionController::Base
  allow_browser versions: :modern
  before_action :authenticate_user!
  add_flash_types :success, :danger

  # ログイン後の遷移先
  def after_sign_in_path_for(resource)
    mypage_path
  end
end
