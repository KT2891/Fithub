class Public::PostsController < ApplicationController
  def index
    @posts = Post.with_user_and_images.all
    # フォーム用インスタンス生成
    @post = Post.new
    @comment = Comment.new
  end

  def show
    @post = Post.find(params[:id])
    # フォーム用インスタンス生成
    @comment = Comment.new
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
