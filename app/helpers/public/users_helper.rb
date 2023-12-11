module Public::UsersHelper

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
