class CreateTrainingCounts < ActiveRecord::Migration[6.1]
  def change
    create_table :training_counts do |t|
      t.bigint :training_detail_id
      t.float :weight
      t.integer :count
      t.text :memo

      t.timestamps
    end
  end
end
