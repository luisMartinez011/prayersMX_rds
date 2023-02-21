class RemoveCantidadFromOrdenes < ActiveRecord::Migration[7.0]
  def change
    remove_column :ordenes, :cantidad, :string
  end
end
