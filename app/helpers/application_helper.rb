module ApplicationHelper

  def sidebar_main_items
    if admin_signed_in?
      admin_sidebar_items
    elsif user_signed_in?
      user_sidebar_items
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
      },
      {
        type: "link",
        path: destroy_admin_session_path,
        text: "Log Out",
        method: :delete
      }
    ]
  end

  def user_sidebar_items
    [
      {
        logo: "fa-regular fa-pen-to-square",
        type: "link",
        path: posts_path,
        text: "Post"
      },
      {
        logo: "fa-regular fa-user",
        type: "link",
        path: following_user_path(current_user),
        text: "Follow"
      },
      {
        logo: "fa-solid fa-dumbbell",
        type: "link",
        path: training_sets_path,
        text: "Training"
      },
      {
        logo: "fa-solid fa-person",
        type: "link",
        path: body_compositions_path,
        text: "My Body"
      },
      {
        logo: "fa-solid fa-user-pen",
        type: "link",
        path: user_path(current_user),
        text: "My Page"
      },
      {
        logo: "fa-regular fa-bell",
        type: "link",
        path: notifications_path,
        text: "Notice",
      },
      {
        logo: "fa-regular fa-hand",
        type: "pup_up",
        text: "Request",
        class: "user-request"
      },
      {
        logo: "fa-solid fa-arrow-right-from-bracket",
        type: "link",
        path: destroy_user_session_path,
        text: "Log Out",
        method: :delete
      }
    ]
  end

end
