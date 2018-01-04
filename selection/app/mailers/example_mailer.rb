class ExampleMailer < ActionMailer::Base
  default from: "eva.simonyi@greenfoxacademy.com>"

  # replace user to applicant!!!

  def sample_email(applicant)
    @applicant = applicant
    mail(to: @applicant.email_address, subject: 'Sample Email')
  end
end
