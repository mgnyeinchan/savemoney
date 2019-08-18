class CreateMonthlyaudits < ActiveRecord::Migration[5.1]
  def change
    create_table :monthlyaudits do |t|
      t.integer :totaldepositamt
      t.integer :totalbalamt
      t.integer :totalexpamt
      t.integer :totalotherexp
      t.integer :user_id
      t.date :time

      t.timestamps
    end
  end
end
