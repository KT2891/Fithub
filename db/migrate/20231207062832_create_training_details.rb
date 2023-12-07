class CreateTrainingDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :training_details do |t|
      t.bigint :user_id
      t.bigint :training_menu_id
      t.bigint :training_set_id
      t.date :date

      t.timestamps
    end
  end
end
