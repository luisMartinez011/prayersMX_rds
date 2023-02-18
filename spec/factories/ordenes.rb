FactoryBot.define do
  factory :ordene do
    producto
    carrito
    cantidad { Faker::Number.number(digits: 2) }
  end
end
