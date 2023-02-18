class Carrito < ApplicationRecord
  has_many :ordenes
  has_many :productos_comprados, through: :ordenes, source: :producto
  belongs_to :usuario
end
