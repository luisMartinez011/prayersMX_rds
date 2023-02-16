class Ordene < ApplicationRecord
  belongs_to :carrito, optional: true
  belongs_to :producto, optional: true
end
