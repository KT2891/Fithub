class Public::RelationshipsController < ApplicationController
  before_action :set_user, only: %i[create destroy]
  def following
    @following = current_user.following
  end

  def followers
    @followers = current_user.followers
  end

  def create
    if current_user.active_relationships.create(followed_id: @user.id)
      redirect_to posts_path, notice: t("success-follow")
    else
      redirect_to posts_path, alert: t("error-follow")
    end
  end

  def destroy
    relationship = current_user.active_relationships.find_by(followed_id: @user.id)
    if relationship.destroy
      redirect_to posts_path, notice: t("success-unfollow")
    else
      redirect_to posts_path, alert: t("error-unfollow")
    end
  end

  private
  def set_user
    @user = User.find(params[:user_id])
  end
end
