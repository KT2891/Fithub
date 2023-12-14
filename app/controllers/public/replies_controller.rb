class Public::RepliesController < ApplicationController
  before_action :set_post, only: %i[create destroy]
  before_action :set_comment, only: %i[create destroy]
  def create
    @reply = current_user.comments.new(reply_params)
    @reply.parent_id = @comment.id
    @reply.save
  end

  def destroy
    reply = Comment.find(params[:id])
    reply.destroy
    @replies = @comment.replies
  end

  private

  def reply_params
    params.require(:comment).permit(:body)
  end

  def set_post
    @post = Post.find(params[:post_id])
  end

  def set_comment
    @comment = Comment.find(params[:comment_id])
  end
end
