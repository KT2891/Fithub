class Admin::UsersController < ApplicationController
  before_action :set_user, only: :update

  def index
    @users = User.with_attached_profile_image
  end

  def update
    @user.update(user_params)
    redirect_to admin_users_path, notice: t("success-update-message")
  end

  private

  def user_params
    params.require(:user).permit(:status)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
