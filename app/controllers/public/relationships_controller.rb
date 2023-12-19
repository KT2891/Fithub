class Public::RelationshipsController < ApplicationController
  before_action :set_user, only: %i[create destroy]
  def following
    @following = current_user.following
    @followers = current_user.followers
  end

  def create
    current_user.active_relationships.create(followed_id: @user.id)
  end

  def destroy
    relationship = current_user.active_relationships.find_by(followed_id: @user.id)
    relationship.destroy
  end

  private
  def set_user
    @user = User.find(params[:user_id])
  end
end
