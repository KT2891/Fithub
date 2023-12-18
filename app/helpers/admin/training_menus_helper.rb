module Admin::TrainingMenusHelper
  def check_active(attr)
    if attr.status == true
      "text-dark"
    else
      "text-black-50"
    end
  end

  def active_text(attr)
    if attr.status == true
      t("active")
    else
      t("negative")
    end
  end

  def text_training_btn
    if current_page?(new_admin_training_menu_path)
      t("add")
    else
      t("edit")
    end
  end

  def admin_training_action(model)
    if current_page?(new_admin_training_menu_path)
      admin_training_menus_path
    else
      admin_training_menu_path(model)
    end
  end
end
