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

  def link_items
    if @user == current_user
      current_user_link_items
    else
      other_user_link_items
    end
  end

  def current_user_link_items
    [
      {
        type: "ajax",
        text: t("post")
      },
      {
        type: "ajax",
        text: t("commnet")
      },
      {
        type: "link",
        path: training_sets_path,
        text: t("my-training")
      },
      {
        type: "link",
        path: body_compositions_path,
        text: "My Body"
      }
    ]
  end

  def other_user_link_items
    [
      {
        type: "ajax",
        text: t("post")
      },
      {
        type: "ajax",
        text: t("commnet")
      }
    ]
  end
end
