class AddShowby3ToSavemoneys < ActiveRecord::Migration[5.1]
  def change
    add_column :savemoneys, :showby3, :integer
  end
end
