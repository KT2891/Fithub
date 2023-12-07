class CreateTrainingDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :training_details do |t|
      t.references :user, null: false, foreign_key: true
      t.references :training_menu, null: false, foreign_key: true
      t.references :training_set, null: false, foreign_key: true
      t.date :date

      t.timestamps
    end
  end
end
