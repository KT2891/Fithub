module Seeds
  class Requests
    def self.create()
      request_data = YAML.load_file(Rails.root.join("db", "seeds", "requests.yml"))

      # すべてのユーザーIDを取得し、配列に変換
      user_ids = User.pluck(:id)
      # nil をユーザーIDのリストに追加
      user_ids << nil

      request_data.each do |request|
        Request.create!(
          user_id: user_ids.sample,
          email: Faker::Internet.email,
          title: request["title"],
          body: request["body"],
          status: [0,1].sample
          )
          puts "[Seeds] Created request #{request["title"]}"
      end
    end
  end
end