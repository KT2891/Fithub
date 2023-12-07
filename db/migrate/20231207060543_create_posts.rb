class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      # t.references :user, type: :bigint, null: false, foreign_key: true
      t.bigint :user_id
      t.references :training_set, foreign_key: true
      t.text :body
      t.integer :show_permission, null: false, default: 0
      t.boolean :share_permission, null: false, default: true

      t.timestamps
    end
  end
end
