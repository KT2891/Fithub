class CreateWeights < ActiveRecord::Migration[6.1]
  def change
    create_table :weights do |t|
      t.bigint :user_id
      t.float :weight
      t.integer :day_or_night
      t.date :date

      t.timestamps
    end
  end
end
