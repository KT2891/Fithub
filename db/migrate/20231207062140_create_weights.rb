class CreateWeights < ActiveRecord::Migration[6.1]
  def change
    create_table :weights do |t|
      t.references :user, null: false, foreign_key: true, limit: 5
      t.float :weight
      t.integer :day_or_night
      t.date :date

      t.timestamps
    end
  end
end
