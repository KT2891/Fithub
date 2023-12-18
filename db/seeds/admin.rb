module Seeds
  class Admins
    def self.create_admin(email, password)
      # Adminが既に存在するかチェック
      unless Admin.exists?(email: email)
        Admin.create!(
          email: email,
          password: password,
        )
        puts "[Seeds] Created Admin user"
      else
        puts "[Seeds] Admin user already exists"
      end
    end
  end
end