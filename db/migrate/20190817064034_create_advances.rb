class CreateAdvances < ActiveRecord::Migration[5.1]
  def change
    create_table :advances do |t|
      t.string :description, limit: 1000
      t.integer :amountdeposit
      t.integer :currentamount
      t.integer :user_id
      t.date :time

      t.timestamps
    end
  end
end
