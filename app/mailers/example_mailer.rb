class ExampleMailer < ActionMailer::Base
  default from: "selection@greenfoxacademy.com"


  def sample_email(applicant)
    @applicant = applicant
    mail(to: @applicant.email_address, subject: 'Sample Email')
  end

end
