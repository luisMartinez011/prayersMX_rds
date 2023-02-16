FactoryBot.define do
  factory :ordene do
    producto
    carrito
    total { Faker::Number.decimal(l_digits: 2) }
    cantidad { Faker::Number.number(digits: 2) }
  end
end
