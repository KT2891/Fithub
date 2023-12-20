class Public::PostsController < ApplicationController
  def index
    # 全てのポスト取得
    # ページネーション1ページ5件
    @posts = Post.with_user_and_images.page(params[:page]).per(5)
    # フォロワーのポストのみ取得
    @follow_posts = current_user.following_posts.with_user_and_images.page(params[:page]).per(5)
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
    post = current_user.posts.new(post_params)
    if params[:post][:selected_date]
      find_training_set
      post.training_set_id = @training_set.id
    end
    if post.save
      redirect_to posts_path, notice: t("post-success-message")
    else
      render :index, alert: t("post-error-message")
    end
  end

  def destroy
    post = Post.find(params[:id])
    if post.user == current_user
      post.destroy
      redirect_to posts_path, notice: t("destroy-post")
    else
      redirect_to posts_path, alert: t("not-have-authenticate")
    end
  end

  private
  def post_params
    params.require(:post).permit(:body, images: [])
  end

  def find_training_set
    date_object = Date.parse(params[:post][:selected_date])
    @training_set = TrainingSet.find_by(user_id: current_user.id, start_time: date_object.beginning_of_day)
  end

end
