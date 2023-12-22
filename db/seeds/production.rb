# 管理者のSeed作成
require_relative "admin"

# 環境変数などに移動の必要あり
DEV_ADMIN_EMAIL = "admin@admin"
DEV_ADMIN_PASSWORD = "adminadmin"

Seeds::Admins.create_admin(
  DEV_ADMIN_EMAIL,
  DEV_ADMIN_PASSWORD,
)


# トレーニングメニューのSeed作成
require_relative "training_menu"
Seeds::TrainingMenus.create

# トレーニング部位のSeed作成
require_relative "training_part"
Seeds::TrainingParts.create