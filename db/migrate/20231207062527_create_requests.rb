class CreateRequests < ActiveRecord::Migration[6.1]
  def change
    create_table :requests do |t|
      t.references :user, foreign_key: true, limit: 5
      t.string :email
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
