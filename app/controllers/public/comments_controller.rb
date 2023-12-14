class Public::CommentsController < ApplicationController
  before_action :set_post, only: %i[create destroy]

  def create
    @comment = current_user.comments.new(comment_params)
    @comment.post_id = @post.id
    @comment.save
  end

  def destroy
    Comment.find(params[:id]).destroy
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
