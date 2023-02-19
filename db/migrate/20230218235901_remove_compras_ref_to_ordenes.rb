class RemoveComprasRefToOrdenes < ActiveRecord::Migration[7.0]
  def change
    remove_column :ordenes, :carrito_id, :integer
  end
end
