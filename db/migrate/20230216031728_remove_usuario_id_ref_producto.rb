class RemoveUsuarioIdRefProducto < ActiveRecord::Migration[7.0]
  def change
    remove_column :productos, :usuario_id, :integer
    remove_column :ordenes, :carrito_id, :integer
    remove_column :ordenes, :producto_id, :integer
    remove_column :ordenes, :carrito_id, :index
    remove_column :ordenes, :producto_id, :index
  end
end
