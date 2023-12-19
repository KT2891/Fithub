module Public::HomesHelper

  def nav_items
    if admin_signed_in?
      admin_nav_items
    elsif user_signed_in?
      user_nav_items
    else
      guest_nav_items
    end
  end


  private
  def admin_nav_items
    [
      {
        type: "link",
        path: posts_path,
        text: "SNS"
      },
      {
        type: "link",
        path: admin_users_path,
        text: t("users")
      },
      {
        type: "link",
        path: admin_requests_path,
        text: t("requests")
      },
      {
        type: "link",
        path: destroy_admin_session_path,
        text: t("log-out"),
        method: :delete
      }
    ]
  end

  def user_nav_items
    [
      {
        type: "pop_up",
        path: new_request_path,
        text: t("requests"),
        toggle: "modal",
        target: "#requestForm"
      },
      {
        type: "link",
        path: about_path,
        text: "About"
      },
      {
        type: "link",
        path: posts_path,
        text: "SNS"
      },
      {
        type: "link",
        path: destroy_user_session_path,
        text: t("log-out"),
        method: :delete
      }
    ]
  end

  def guest_nav_items
    [
      {
        type: "pop_up",
        text: t("requests"),
        class: "guest-request",
        toggle: "modal",
        target: "#requestForm"
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
end
