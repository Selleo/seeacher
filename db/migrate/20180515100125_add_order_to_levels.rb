class AddOrderToLevels < ActiveRecord::Migration[5.1]
  def change
    add_column :levels, :order, :integer
  end
end
