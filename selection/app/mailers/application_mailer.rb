class ApplicationMailer < ActionMailer::Base
  default from: "eva.simonyi@greenfoxacademy.com>"

  def sample_email(applicant)
    @applicant = applicant
    mail(to: @applicant.email_address, subject: 'Sample Email')
    redirect_to root_path
  end
end
