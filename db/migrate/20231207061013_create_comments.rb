class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.references :user, null: false, foreign_key: true, limit: 5
      t.references :post, foreign_key: true, limit: 5
      t.references :commnet, foreign_key: true, limit: 5
      t.text :body

      t.timestamps
    end
  end
end
