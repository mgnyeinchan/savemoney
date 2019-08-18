class CreateDailyexps < ActiveRecord::Migration[5.1]
  def change
    create_table :dailyexps do |t|
      t.string :description, limit: 1000
      t.integer :amount
      t.integer :user_id
      t.date :time

      t.timestamps
    end
  end
end
