FactoryBot.define do
  factory :carrito do
    total { Faker::Number.decimal(l_digits: 2) }
    usuario
    factory :carrito_with_orders do
      # posts_count is declared as a transient attribute available in the
      # callback via the evaluator

      # the after(:create) yields two values; the user instance itself and the
      # evaluator, which stores all values from the factory, including transient
      # attributes; `create_list`'s second argument is the number of records
      # to create and we make sure the user is associated properly to the post
      after(:create) do |carrito, evaluator|
        create_list(:ordene, 3, carrito: carrito)
        carrito.reload
      end
    end
  end
end
