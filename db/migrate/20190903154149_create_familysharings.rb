class CreateFamilysharings < ActiveRecord::Migration[5.1]
  def change
    create_table :familysharings do |t|
      t.integer :user_id
      t.integer :shareto1
      t.integer :shareto2
      t.integer :shareto3
      t.integer :shareto4
      t.integer :shareto5

      t.timestamps
    end
  end
end
