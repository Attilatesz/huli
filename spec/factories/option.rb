FactoryBot.define do
  factory :option do
    category { Faker::Lorem.words(4) }
    name { Faker::Lorem.words(6) }
    message { Faker::Lorem.words(10) }
  end
end
