class ApplicationController < ActionController::Base
  # top.aboutアクションを除いてログイン
  before_action :authenticate_user!, except: [:top, :about]
	before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  # サインインしたらログインしたユーザー画面
  def after_sign_in_path_for(resource)
    user_path(current_user)
  end
  
  # ログアウトしたらトップ画面へ
  def after_sign_out_path_for(resource)
    root_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end
end
