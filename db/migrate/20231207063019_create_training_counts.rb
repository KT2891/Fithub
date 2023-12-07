class CreateTrainingCounts < ActiveRecord::Migration[6.1]
  def change
    create_table :training_counts do |t|
      t.references :training_detail, null: false, foreign_key: true
      t.float :weight
      t.integer :count
      t.text :memo

      t.timestamps
    end
  end
end
