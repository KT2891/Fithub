class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: %i[top about sign_up ], unless: :admin_signed_in?
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :check_user_status,except: %i[top about sign_up ], unless: :admin_signed_in?
  before_action :authenticate_admin!, if: :admin_area?

  
  protected
  # ユーザーがactive出ない場合はログアウトしてtopに飛ばす
  def check_user_status
    if user_signed_in? && current_user.status != "active"
      sign_out current_user
      flash[:alert] = t("log-in-user-quit")
      redirect_to root_path
    end
  end
  
  # ログイン後のリダイレクト先変更
  def after_sign_in_path_for(resource)
    case resource
    when Admin
      posts_path
    when User
      posts_path
    end
  end

  # ログアウト後のリダイレクト先変更
  def after_sign_out_path_for(resource)
    case resource
    when :admin
      root_path
    when :user
      root_path
    end
  end
  
  # リダイレクト先をログイン画面からルートパスに変更
  def authenticate_admin!
    unless current_admin
      redirect_to root_path
    end
  end

  # sign_inページ以外のadminが含まれるurlにリクエストする場合 TRUE
  def admin_area?
    request.fullpath.include?("/admin") && !request.fullpath.include?("/admin/sign_in")
  end

  # 登録時のストロングパラメータ
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name sex height])
  end

end
