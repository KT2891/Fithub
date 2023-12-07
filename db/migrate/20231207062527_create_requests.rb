class CreateRequests < ActiveRecord::Migration[6.1]
  def change
    create_table :requests do |t|
      t.bigint :user_id
      t.string :email
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
