class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.references :user, type: :bigint, null: false, foreign_key: true
      t.references :post, type: :bigint, foreign_key: true
      t.references :commnet, type: :bigint, foreign_key: true
      t.text :body

      t.timestamps
    end
  end
end
