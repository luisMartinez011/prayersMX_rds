class AddComprasRefToOrdenes < ActiveRecord::Migration[7.0]
  def change
    add_reference :ordenes, :compra, null: true, foreign_key: true
  end
end
