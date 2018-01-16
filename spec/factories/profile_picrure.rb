FactoryBot.define do
  factory :profile_picture do
    applicant
  end

  trait :image do
    image Dragonfly.app.fetch_file('./spec/assets/girl1.jpg')
  end

  trait :image_upload do
    image { fixture_file_upload './spec/assets/girl1.jpg', 'application/jpg' }
  end

  trait :image2_upload do
    image { fixture_file_upload './spec/assets/girl2.jpeg', 'application/jpeg' }
  end

  trait :wrong_image_format_upload do
    image { fixture_file_upload './spec/assets/boy2.bmp', 'application/bmp' }
  end
end
