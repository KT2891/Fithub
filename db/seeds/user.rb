module Seeds
  class Users
    SEX_RANGE = 0..2
    HEIGHT_RANGE = 140..190
    USER_STATUS_RANGE = 0..2
    USER_SHARE_PERMISSION_RANGE = 0..1

    def self.create_dev_user(email, password)
      User.create!(
        email: email,
        password: password,
        password_confirmation: password,
        name: "テストユーザー",
        sex: 1,
        height: 175,
        birthday: 1995-01-01,
        status: 0,
        share_permission: 0
      )
      puts "[Seeds] Created User for development"
    end

    def self.create_fake_users(users_count)
      # 日本のロケールを設定
      Faker::Config.locale = "ja"

      users_count.times do |i|
        User.create!(
          email: Faker::Internet.email,
          password: "password",
          password_confirmation: "password",
          name: Faker::Name.name,
          sex: rand(SEX_RANGE),
          height: [(HEIGHT_RANGE).to_a, nil].flatten.sample,
          birthday: Faker::Date.between(from: '1970-01-01', to: '2005-12-25').strftime('%Y-%m-%d'),
          status: rand(USER_STATUS_RANGE),
          share_permission: rand(USER_SHARE_PERMISSION_RANGE)
        )
        puts "[Seeds] Created User with the Faker #{i}"
      end
    end
  end
end