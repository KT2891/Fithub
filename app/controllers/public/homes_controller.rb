class Public::HomesController < ApplicationController
  def top
    @user = User.new
    @devise_mapping = Devise.mappings[:user]
    @resource_name = :user
  end

  def about
  end
end
