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
end
