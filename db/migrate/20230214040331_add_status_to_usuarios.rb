class AddStatusToUsuarios < ActiveRecord::Migration[7.0]
  def change
    add_column :usuarios, :role, :integer, default: 0
  end
end
