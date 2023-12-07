class CreateTrainingParts < ActiveRecord::Migration[6.1]
  def change
    create_table :training_parts do |t|
      t.references :training_menu, null: false, foreign_key: true, limit: 5
      t.integer :training_part

      t.timestamps
    end
  end
end
