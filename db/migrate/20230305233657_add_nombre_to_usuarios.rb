class AddNombreToUsuarios < ActiveRecord::Migration[7.0]
  def change
    add_column :usuarios, :nombre, :string
    add_column :usuarios, :imagen, :string
    add_column :usuarios, :rol, :integer, default: 0
    add_column :usuarios, :telefono, :string
    add_column :usuarios, :calle, :string
    add_column :usuarios, :ciudad, :string
    add_column :usuarios, :estado, :string
    add_column :usuarios, :pais, :string
  end
end
