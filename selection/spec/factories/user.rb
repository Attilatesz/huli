FactoryBot.define do
  factory :user do
    provider "google"
    uid { Devise.friendly_token[0, 20] }
    email { Faker::Internet.email }
    access_token  { Devise.friendly_token[0, 20] }
    admin false
  end
end