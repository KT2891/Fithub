class Public::PostsController < ApplicationController
  def index
    @posts = Post.all
    @post = Post.new
  end

  def show
  end

  def create
    if post = current_user.posts.create(post_params)
      redirect_to posts_path
    else
      flash[:alert] = t("post-error-message")
      render :index
    end
  end

  private
  def post_params
    params.require(:post).permit(:body)
  end
end
