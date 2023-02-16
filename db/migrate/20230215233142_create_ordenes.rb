class CreateOrdenes < ActiveRecord::Migration[7.0]
  def change
    create_table :ordenes do |t|
      t.string :total
      t.string :Float
      t.string :cantidad
      t.string :Integer

      t.timestamps
    end
  end
end
