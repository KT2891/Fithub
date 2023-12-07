class CreateTrainingSets < ActiveRecord::Migration[6.1]
  def change
    create_table :training_sets do |t|
      t.references :user, null: false, foreign_key: true, limit: 5
      t.date :date

      t.timestamps
    end
  end
end
