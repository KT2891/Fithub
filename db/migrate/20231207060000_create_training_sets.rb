class CreateTrainingSets < ActiveRecord::Migration[6.1]
  def change
    create_table :training_sets do |t|
      t.bigint :user_id
      t.datetime :start_time

      t.timestamps
    end
  end
end
