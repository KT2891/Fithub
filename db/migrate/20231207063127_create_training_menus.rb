class CreateTrainingMenus < ActiveRecord::Migration[6.1]
  def change
    create_table :training_menus do |t|
      t.string :name
      t.text :explanation
      t.boolean :status, null: false, default: true

      t.timestamps
    end
  end
end
