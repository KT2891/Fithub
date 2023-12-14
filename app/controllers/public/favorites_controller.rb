class Public::FavoritesController < ApplicationController
  before_action :set_post, only: %i[create destroy]

  def create
    current_user.favorites.create(post_id: @post.id)
  end

  def destroy
    favorite = current_user.favorites.find_by(post_id: @post.id)
    favorite.destroy
  end

  private
  def set_post
    @post = Post.find(params[:post_id])
  end
end
