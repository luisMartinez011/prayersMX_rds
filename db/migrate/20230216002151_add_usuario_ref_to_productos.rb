class AddUsuarioRefToProductos < ActiveRecord::Migration[7.0]
  def change
    add_column :productos, :usuario_id, :integer
  end
end
