# 管理者のSeed作成
require_relative "admin"

Seeds::Admins.create_admin(
  ENV['DEV_ADMIN_EMAIL'],
  ENV['DEV_ADMIN_PASSWORD']
)


# トレーニングメニューのSeed作成
require_relative "training_menu"
Seeds::TrainingMenus.create

# トレーニング部位のSeed作成
require_relative "training_part"
Seeds::TrainingParts.create