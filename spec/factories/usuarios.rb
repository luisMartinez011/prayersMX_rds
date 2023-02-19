FactoryBot.define do
  factory :usuario do
    email { Faker::Internet.email }
    password { "samurai" }
    name { Faker::Internet.username }
    role { "usuario" }
  end
end
