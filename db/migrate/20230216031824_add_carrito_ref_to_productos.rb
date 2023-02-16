class AddCarritoRefToProductos < ActiveRecord::Migration[7.0]
  def change
    add_reference :ordenes, :carrito, null: true, foreign_key: true
    add_reference :ordenes, :producto, null: true, foreign_key: true
  end
end
