class Compra < ApplicationRecord
  has_many :ordenes
  belongs_to :usuario
end
