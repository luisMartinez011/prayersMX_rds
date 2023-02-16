class RemoveFloatToOrdenes < ActiveRecord::Migration[7.0]
  def change
    remove_column :carritos, :Float, :string
    remove_column :compras, :Float, :string
    remove_column :ordenes, :Float, :string
    remove_column :ordenes, :Integer, :string
  end
end
