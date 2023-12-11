class Public::CommentsController < ApplicationController

  def create
    post = Post.find(params[:post_id])
    comment = current_user.comments.new(comment_params)
    comment.post_id = post.id
    comment.save
    flash[:notice] = t("success_create_comment")
    redirect_to posts_path
  end

  def destroy
    comment = Comment.find(params[:id]).destroy
    redirect_to posts_path
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
