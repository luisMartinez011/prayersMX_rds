class AddCantidadFromOrdenes < ActiveRecord::Migration[7.0]
  def change
    add_column :ordenes, :cantidad, :integer
    remove_column :ordenes, :total, :string
  end
end
