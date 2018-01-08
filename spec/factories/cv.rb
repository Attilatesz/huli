FactoryBot.define do
  factory :cv do
    cv Dragonfly.app.fetch_file('./spec/assets/pdf-sample.pdf')
    applicant
  end
  factory :attachment do
    file ActionDispatch::Http::UploadedFile.new(:tempfile => File.new("#{Rails.root}/spec/assets/pdf-sample.pdf"), :filename => "pdf-sample.pdf")
  end
end
