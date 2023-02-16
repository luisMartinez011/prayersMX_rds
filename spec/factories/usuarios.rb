FactoryBot.define do
  factory :usuario do
    producto
    email { Faker::Internet.email }
    password { "samurai" }
    name { Faker::Internet.username }
    role { "admin" }
  end
end
