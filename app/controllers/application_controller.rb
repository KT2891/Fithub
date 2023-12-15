class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: %i[top about sign_up]

  protected

  def after_sign_in_path_for(resource)
    case resource
    when Admin
      admin_root_path
    when User
      posts_path
    end
  end

  def after_sign_out_path_for(resource)
    case resource
    when :admin
      new_admin_session_path
    when :user
      root_path
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name sex height])
  end
end
