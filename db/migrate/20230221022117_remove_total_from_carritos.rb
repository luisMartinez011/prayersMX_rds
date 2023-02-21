class RemoveTotalFromCarritos < ActiveRecord::Migration[7.0]
  def change
    remove_column :carritos, :total, :string
    remove_column :compras, :total, :string
  end
end
