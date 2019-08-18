class AddShowby2ToSavemoneys < ActiveRecord::Migration[5.1]
  def change
    add_column :savemoneys, :showby2, :integer
  end
end
