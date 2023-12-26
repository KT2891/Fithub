class Public::CommentsController < ApplicationController
  before_action :set_post, only: %i[create destroy]

  def create
    @comment = current_user.comments.new(comment_params)
    @comment.post_id = @post.id
    @comment.save
    @post.create_notification_comment!(current_user, @comment.id)
  end

  def destroy
    @comment = Comment.find(params[:id])
    # コメント投稿者とログインユーザが一致した場合のみ削除可能
    @comment.destroy if @comment.user == current_user
    @comments = @post.comments
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

  def set_post
    @post = Post.find(params[:post_id])
  end
end
