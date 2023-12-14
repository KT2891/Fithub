class Public::RepliesController < ApplicationController
  before_action :set_post %i[create destroy]
  before_action :set_comment %i[create destroy]
  def create
    @reply = current_user.comments.create(commnet_id: @comment.id)
    
  end

  def destroy
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def set_comment
    @comment = Comment.find(params[:comment_id])
  end
end
