class ApplicationController < ActionController::Base

  private
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
end
