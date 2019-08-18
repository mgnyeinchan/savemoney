class AddShowby1ToSavemoneys < ActiveRecord::Migration[5.1]
  def change
    add_column :savemoneys, :showby1, :integer
  end
end
