module ApplicationHelper

  def sidebar_main_items
    if admin_signed_in?
      admin_sidebar_items
    elsif user_signed_in?
      user_sidebar_items
    else
      guest_sidebar_items
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
        path: admin_posts_path,
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
        text: t("requests")
      },
      {
        type: "link",
        path: following_user_path,
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
        path: user_path,
        text: "My Page"
      },
    ]
  end


  def guest_sidebar_items
    [
      {
        type: "pop_up",
        text: t("requests"),
        class: "guest-request"
      },
      {
        type: "link",
        path: about_path,
        text: "About"
      },
      {
        type: "link",
        path: new_user_registration_path,
        text: t("regstration-up")
      },
      {
        type: "pop_up",
        text: t("log-in"),
        class: "guest-login"
      }
    ]
  end

  def admin_sidebar_sub_items
    [
      {
        type: "link",
        path: destroy_admin_session_path,
        text: t("log-out"),
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
