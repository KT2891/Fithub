module ApplicationHelper

  def sidebar_main_items
    if admin_signed_in?
      admin_sidebar_items
    elsif user_signed_in?
      user_sidebar_items
    end
  end

  def sidebar_sub_items
    if admin_signed_in?
      admin_sidebar_sub_items
    else
      user_sidebar_sub_items
    end
  end

  private

  def admin_sidebar_items
    [
      {
        type: "link",
        path: posts_path,
        text: "Post",
      },
      {
        type: "link",
        path: admin_training_menus_path,
        text: "Training"
      },
      {
        type: "link",
        path: admin_users_path,
        text: "Users"
      },
      {
        type: "link",
        path: admin_requests_path,
        text: "Requests"
      }
    ]
  end

  def user_sidebar_items
    [
      {
        type: "link",
        path: posts_path,
        text: "Post"
      },
      {
        type: "link",
        path: following_user_path(current_user),
        text: "Follow"
      },
      {
        type: "link",
        path: training_sets_path,
        text: "Training"
      },
      {
        type: "link",
        path: body_compositions_path,
        text: "My Body"
      },
      {
        type: "link",
        path: user_path(current_user),
        text: "My Page"
      },
    ]
  end

  def admin_sidebar_sub_items
    [
      {
        type: "link",
        path: destroy_admin_session_path,
        text: "Log Out",
        method: :delete
      }
    ]
  end

  def user_sidebar_sub_items
    [
      {
        type: "pup_up",
        text: "Request",
        class: "user-request"
      },
      {
        type: "link",
        path: destroy_user_session_path,
        text: "Log Out",
        method: :delete
      }
    ]
  end
end
