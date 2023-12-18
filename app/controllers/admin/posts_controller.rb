class Admin::PostsController < ApplicationController
  def destroy
    Post.find(params[:id]).destroy
    redirect_to posts_path, notice: t("destroy-post")
  end
end
