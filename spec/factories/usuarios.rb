FactoryBot.define do
  factory :usuario do
    email { Faker::Internet.email }
    password { "samurai" }
    name { Faker::Internet.username }
    role { "admin" }
  end
end
