FactoryBot.define do
  factory :usuario do
    email { Faker::Internet.email }
    password { "samurai" }
    nombre { Faker::Internet.username }
    rol { "admin" }
    telefono { Faker::PhoneNumber.cell_phone }
    calle { Faker::Address.street_name }
    ciudad { Faker::Address.city }
    estado { Faker::Address.state }
    pais { Faker::Address.country }
    numero_casa { Faker::Address.building_number }
    imagen { Faker::LoremFlickr.image(size: "50x60") }
  end
end
