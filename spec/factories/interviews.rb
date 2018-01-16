FactoryBot.define do
  factory :interview do
    applicant
    interviewer { Faker::Name.name }
    start { Faker::Time.forward(7, :morning) }
  end
end
