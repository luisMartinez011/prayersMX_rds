FactoryBot.define do
  factory :ordene do
    producto
    carrito
    compra
    cantidad { Faker::Number.between(from: 1, to: 100) }
  end
end
