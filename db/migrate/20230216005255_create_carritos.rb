class CreateCarritos < ActiveRecord::Migration[7.0]
  def change
    create_table :carritos do |t|
      t.string :total
      t.string :Float

      t.timestamps
    end
  end
end
