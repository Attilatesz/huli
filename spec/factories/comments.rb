FactoryBot.define do
  factory :comment do
    commenter "MyString"
    body "MyText"
    commentable nil
  end
end
