class AddFechaEntregaToCompras < ActiveRecord::Migration[7.0]
  def change
    add_column :compras, :entrega, :string
  end
end
