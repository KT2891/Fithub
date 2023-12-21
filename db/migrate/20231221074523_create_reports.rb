class CreateReports < ActiveRecord::Migration[6.1]
  def change
    create_table :reports do |t|
      t.bigint :reporter_id
      t.bigint :reported_id
      t.bigint :post_id
      t.text :reason
      t.integer :status

      t.timestamps
    end
  end
end
