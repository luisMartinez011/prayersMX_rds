class AddUsuarioRefToCarrito < ActiveRecord::Migration[7.0]
  def change
    add_reference :carritos, :usuario, foreign_key: true
    add_reference :compras, :usuario, foreign_key: true
  end
end
