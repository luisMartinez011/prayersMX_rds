class AddNumeroToUsuarios < ActiveRecord::Migration[7.0]
  def change
    add_column :usuarios, :numero_casa, :integer
    remove_column :usuarios, :telefono, :string
  end
end
