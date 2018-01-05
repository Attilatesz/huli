class WelcomeController < ApplicationController
    def index
    end

    def profile
      ExampleMailer.sample_email(Applicant.first).deliver
      redirect_to root_path unless current_user
    end

    def send_email
      MyMailer.send_email(name: params[:name], phone: params[:phone], email: params[:email], message: params[:message]).deliver
      redirect_to root_url, notice: "Email sent!"
    end
end
