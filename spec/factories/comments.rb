FactoryBot.define do
  factory :comment do
    body { Faker::Lorem.sentence }
    commentable nil
  end
end
