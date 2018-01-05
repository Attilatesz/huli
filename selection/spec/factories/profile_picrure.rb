FactoryBot.define do
  factory :profile_picture do
    image Dragonfly.app.fetch_file('./spec/assets/girl1.jpg')
    applicant
  end
end
