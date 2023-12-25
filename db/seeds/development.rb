# 管理者のSeed作成
require_relative "admin"

Seeds::Admins.create_admin(
  ENV['DEV_ADMIN_EMAIL'],
  ENV['DEV_ADMIN_PASSWORD']
)

# 顧客のSeed作成
require_relative "user"

DEV_USER_EMAIL = "test@test.com"
DEV_USER_PASSWORD = "password"

FAKE_USERS_COUNT = 20

Seeds::Users.create_dev_user(
  DEV_USER_EMAIL,
  DEV_USER_PASSWORD
)
Seeds::Users.create_fake_users(FAKE_USERS_COUNT)

# リクエストのSeed作成
require_relative "request"
Seeds::Requests.create

# トレーニングメニューのSeed作成
require_relative "training_menu"
Seeds::TrainingMenus.create

# トレーニング部位のSeed作成
require_relative "training_part"
Seeds::TrainingParts.create