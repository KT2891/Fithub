class Public::HomesController < ApplicationController
  def top
    @user = User.new
    @devise_mapping = Devise.mappings[:user]
    @resource_name = :user
    
    if user_signed_in? || admin_signed_in?
      redirect_to posts_path
    end
  end
end
