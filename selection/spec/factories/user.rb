FactoryBot.define do
  factory :user do
    provider "google"
    uid "123456"
    email "John@Doe.com"
    access_token  "987654"
    admin false
  end
end