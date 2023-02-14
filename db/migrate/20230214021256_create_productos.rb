class CreateProductos < ActiveRecord::Migration[7.0]
  def change
    create_table :productos do |t|
      t.string :nombre
      t.float :precio
      t.string :descripcion
      t.string :imagen

      t.timestamps
    end
  end
end
