FactoryBot.define do
  factory :applicant do
    id 1
    first_name "John"
    last_name "Doe"
    email_address "John@Doe.com"
    phone_number  "0123456789"
    highest_education "BA"
    english_knowledge "Basic"
    english_class "yes"
    payment_option "prepaid"
    created_at "2018-01-03 08:11:26"
    updated_at "2018-01-03 08:11:26"
   # user_id 16
    status "basic"
  end
end