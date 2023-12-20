module Public::PostsHelper

  def destroy_authenticate?(post)
    post.user == current_user || admin_signed_in?
  end

  def comment_icon(post)
    if post.comments.present?
      "fa-solid fa-comment"
    else
      "fa-regular fa-comment"
    end
  end

  def destroy_move(post)
    if admin_signed_in?
      admin_post_path(post)
    else user_signed_in?
      post_path(post)
    end
  end
end
