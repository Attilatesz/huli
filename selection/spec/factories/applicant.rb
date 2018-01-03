FactoryBot.define do
  factory :applicant do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email_address { Faker::Internet.email }
    phone_number  { Faker::Number.number(12)}
    highest_education "BA"
    english_knowledge "Basic"
    english_class { Faker::Boolean.boolean }
    payment_option "prepaid"
  end
end