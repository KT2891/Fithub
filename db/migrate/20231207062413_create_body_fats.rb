class CreateBodyFats < ActiveRecord::Migration[6.1]
  def change
    create_table :body_fats do |t|
      t.references :user, null: false, foreign_key: true, limit: 5
      t.float :body_fat
      t.integer :day_or_night
      t.date :date

      t.timestamps
    end
  end
end
