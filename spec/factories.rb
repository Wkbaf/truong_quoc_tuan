FactoryBot.define do
  
  factory :user do
    sequence(:email) { |n| "test#{n}@test.com"}
    name { Faker::Lorem.unique.word }
    password { "12345678" }
  end

  factory :store do
    association :user
    name { Faker::Lorem.unique.word }
  end

  factory :product do
    association :user
    association :store
    name { Faker::Lorem.unique.word }
    price { Faker::Number.decimal(l_digits: 2, r_digits: 2) }
    quantity { Faker::Number.digit }
  end
end