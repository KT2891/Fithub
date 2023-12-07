class CreateTrainingDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :training_details do |t|
      t.references :user, type: :bigint, null: false, foreign_key: true
      t.references :training_menu, type: :bigint, null: false, foreign_key: true
      t.references :training_set, type: :bigint, null: false, foreign_key: true
      t.date :date

      t.timestamps
    end
  end
end
