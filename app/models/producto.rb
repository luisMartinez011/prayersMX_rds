class Producto < ApplicationRecord
  belongs_to :usuario, optional: true
end
