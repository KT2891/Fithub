module ApplicationHelper

  def sidebar_main_items
    if admin_signed_in?
      admin_sidebar_items
    elsif user_signed_in?
      user_sidebar_items
    end
  end
  
  def sidebar_nothing?
    current_page?(root_path) ||
    current_page?(new_admin_session_path) ||
    current_page?(new_user_registration_path)
  end
  
  private

  def admin_sidebar_items
    [
      {
        logo: "fa-regular fa-pen-to-square",
        type: "link",
        path: posts_path,
        text: "Post",
        border: params[:controller] == 'posts' ? "active" : nil
      },
      {
        logo: "fa-solid fa-dumbbell",
        type: "link",
        path: admin_training_menus_path,
        text: "Training",
        border: current_page?("/training") ? "active" : nil
      },
      {
        logo: "fa-regular fa-user",
        type: "link",
        path: admin_users_path,
        text: "Users"
      },
      {
        logo: "fa-regular fa-hand",
        type: "link",
        path: admin_requests_path,
        text: "Requests"
      },
      {
        logo: "fa-solid fa-triangle-exclamation",
        type: "link",
        path: admin_reports_path,
        text: "Reports"
      },
      {
        logo: "fa-solid fa-arrow-right-from-bracket",
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
        text: "Post",
        border: controller.controller_name == 'posts' ? "active" : nil
      },
      {
        logo: "fa-regular fa-user",
        type: "link",
        path: following_user_path(current_user),
        text: "Follow",
        border: controller.controller_name == 'relationships' ? "active" : nil
      },
      {
        logo: "fa-solid fa-dumbbell",
        type: "link",
        path: training_sets_path,
        text: "Training",
        border: 
          if controller.controller_name == 'training_sets' || controller.controller_name == 'training_details'
            "active"
          end
      },
      {
        logo: "fa-solid fa-person",
        type: "link",
        path: body_compositions_path,
        text: "My Body",
        border: controller.controller_name == 'body_compositions' ? "active" : nil
      },
      {
        logo: "fa-solid fa-user-pen",
        type: "link",
        path: user_path(current_user),
        text: "My Page",
        border: current_page?(user_path(current_user)) ? "active" : nil
      },
      {
        logo: "fa-regular fa-bell",
        type: "link",
        path: notifications_path,
        text: "Notice",
        border: controller.controller_name == 'notifications' ? "active" : nil
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
