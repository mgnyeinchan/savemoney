class CreateSavemoneys < ActiveRecord::Migration[5.1]
  def change
    create_table :savemoneys do |t|
      t.string :description, limit: 1000
      t.integer :amount
      t.integer :showto1
      t.integer :showto2
      t.integer :showto3
      t.integer :user_id
      t.date :time

      t.timestamps
    end
  end
end
