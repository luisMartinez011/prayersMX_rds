class AddTotalToCarritos < ActiveRecord::Migration[7.0]
  def change
    add_column :carritos, :total, :float
    add_column :compras, :total, :float
  end
end
