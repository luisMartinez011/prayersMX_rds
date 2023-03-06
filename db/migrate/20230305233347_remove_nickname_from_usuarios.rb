class RemoveNicknameFromUsuarios < ActiveRecord::Migration[7.0]
  def change
    remove_column :usuarios, :name, :string
    remove_column :usuarios, :nickname, :string
    remove_column :usuarios, :image, :string
    remove_column :usuarios, :role, :integer
  end
end
