class CreateTrainingSets < ActiveRecord::Migration[6.1]
  def change
    create_table :training_sets do |t|
      t.bigint :user_id
      t.date :date

      t.timestamps
    end
  end
end
