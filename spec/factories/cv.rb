FactoryBot.define do
  factory :cv do
    applicant
  end

  trait :pdf do
    cv Dragonfly.app.fetch_file('./spec/assets/pdf-sample.pdf')
  end

  trait :pdf2 do
    cv Dragonfly.app.fetch_file('./spec/assets/pdf-sample2.pdf')
  end

  trait :pdf_upload do
    cv { fixture_file_upload './spec/assets/pdf-sample.pdf', 'application/pdf' }
  end

  trait :pdf2_upload do
    cv { fixture_file_upload './spec/assets/pdf-sample2.pdf', 'application/pdf' }
  end

  trait :doc_upload do
    cv { fixture_file_upload './spec/assets/TestWordDoc.doc', 'application/doc' }
  end
end
