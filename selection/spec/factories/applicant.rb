FactoryBot.define do
  factory :applicant do
    first_name "John"
    last_name "Doe"
    email_address "John@Doe.com"
    phone_number  "0123456789"
    highest_education "BA"
    english_knowledge "Basic"
    english_class "yes"
    payment_option "prepaid"
  end
end