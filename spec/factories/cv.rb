FactoryBot.define do
  factory :cv do
    cv Dragonfly.app.fetch_file('./spec/assets/pdf-sample.pdf')
    applicant
  end
end
