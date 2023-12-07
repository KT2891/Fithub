class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.bigint :user_id
      t.bigint :training_set_id
      t.text :body
      t.integer :show_permission, null: false, default: 0
      t.boolean :share_permission, null: false, default: true

      t.timestamps
    end
  end
end
