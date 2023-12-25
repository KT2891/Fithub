class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: %i[top about sign_up ], unless: :admin_signed_in?
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :check_user_status,except: %i[top about sign_up ], unless: :admin_signed_in?

  
  protected
  
  def check_user_status
    if user_signed_in? && current_user.status != "active"
      sign_out current_user
      flash[:alert] = t("log-in-user-quit")
      redirect_to root_path
    end
  end

  def after_sign_in_path_for(resource)
    case resource
    when Admin
      posts_path
    when User
      posts_path
    end
  end

  def after_sign_out_path_for(resource)
    case resource
    when :admin
      root_path
    when :user
      root_path
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name sex height])
  end

end
