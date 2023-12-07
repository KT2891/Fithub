# 管理者のSeed作成
require_relative "seeds/admin"

DEV_ADMIN_EMAIL = "admin@admin"
DEV_ADMIN_PASSWORD = "adminadmin"

Seeds::Admins.create(
  DEV_ADMIN_EMAIL,
  DEV_ADMIN_PASSWORD,
)

# 顧客のSeed作成
require_relative "seeds/user"

DEV_USER_EMAIL = "test@test.com"
DEV_USER_PASSWORD = "password"

FAKE_USERS_COUNT = 20

Seeds::Users.create_dev_user(
  DEV_USER_EMAIL,
  DEV_USER_PASSWORD
)
Seeds::Users.create_fake_users(FAKE_USERS_COUNT)

# ジャンルのSeed作成
require_relative "seeds/request"
Seeds::Requests.create

# 商品のSeed作成
require_relative "seeds/training_menu"
Seeds::TrainingMenus.create

require_relative "seeds/training_part"
Seeds::TrainingParts.create