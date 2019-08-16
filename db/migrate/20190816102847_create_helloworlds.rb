class CreateHelloworlds < ActiveRecord::Migration[5.1]
  def change
    create_table :helloworlds do |t|
      t.string :name
      t.string :title

      t.timestamps
    end
  end
end
