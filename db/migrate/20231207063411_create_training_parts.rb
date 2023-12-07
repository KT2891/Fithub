class CreateTrainingParts < ActiveRecord::Migration[6.1]
  def change
    create_table :training_parts do |t|
      t.bigint :training_menu_id
      t.integer :training_part

      t.timestamps
    end
  end
end
