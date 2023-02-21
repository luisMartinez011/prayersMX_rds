class AddTotalFromOrdenes < ActiveRecord::Migration[7.0]
  def change
    add_column :ordenes, :total, :float
  end
end
