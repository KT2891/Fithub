class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.bigint :user_id
      t.bigint :post_id
      t.bigint :commnet_id
      t.text :body

      t.timestamps
    end
  end
end
