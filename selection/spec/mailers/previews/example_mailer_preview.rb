# Preview all emails at http://localhost:3000/rails/mailers/example_mailer
class ExampleMailerPreview < ActionMailer::Preview
  def sample_mail_preview
    ExampleMailer.sample_email(Applicant.first)
  end

  def test_send_email
    ExampleMailer.sample_email(Applicant.first)
  end
end
