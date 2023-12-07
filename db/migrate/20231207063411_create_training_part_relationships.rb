class CreateTrainingPartRelationships < ActiveRecord::Migration[6.1]
  def change
    create_table :training_part_relationships do |t|
      t.references :training_part, null: false, foreign_key: true
      t.references :training_menu, null: false, foreign_key: true

      t.timestamps
    end
  end
end
