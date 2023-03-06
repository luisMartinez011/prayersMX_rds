class AddTelefonoToUsuarios < ActiveRecord::Migration[7.0]
  def change
    add_column :usuarios, :telefono, :integer
  end
end
