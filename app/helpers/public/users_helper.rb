module Public::UsersHelper

  def user_birth_year(user)
    # 誕生年のセレクトボックスのデフォルト位置を設定
    user.birthday.nil? ? 1960 : user.birthday.year
  end
  def user_birth_month(user)
    # 誕生月のセレクトボックスのデフォルト位置を設定
    user.birthday.nil? ? 1 : user.birthday.month
  end
  def user_birth_day(user)
    # 誕生日のセレクトボックスのデフォルト位置を設定
    user.birthday.nil? ? 1 : user.birthday.day
  end

  def current_user_link_items
    [
      {
        path: training_sets_path,
        text: t("my-training"),
        class: "btn btn-primary"
      },
      {
        path: body_compositions_path,
        text: "My Body",
        class: "btn btn-primary"
      },      
      {
        path: edit_user_path,
        text: t("edit"),
        class: "btn btn-success"
      },
      {
        path: destroy_user_session_path,
        text: "Log Out",
        class: "btn btn-danger",
        method: :delete
      }
    ]
  end
end
