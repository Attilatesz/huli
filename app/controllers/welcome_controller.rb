class WelcomeController < ApplicationController
    def index
    end

    def profile
      ExampleMailer.sample_email(Applicant.first).deliver
      redirect_to root_path unless current_user
    end
end
