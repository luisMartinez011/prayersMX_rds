class RemovePartNumberSFromProductos < ActiveRecord::Migration[7.0]
  def change
    remove_column :productos, :huevoss, :decimal
  end
end
