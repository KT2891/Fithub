class CreateRelationships < ActiveRecord::Migration[6.1]
  def change
    create_table :relationships do |t|
      t.bigint :followed_id, null: false, foreign_key: { to_table: :users }
      t.bigint :follower_id, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
    add_index :relationships, :follower_id
    add_index :relationships, :followed_id

    add_index :relationships, [:follower_id, :followed_id], unique: true
  end
end
