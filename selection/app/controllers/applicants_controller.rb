class ApplicantsController < ApplicationController
  def new
    @applicant = Applicant.new
  end

  def create
    @applicant = current_user.create_applicant(applicant_params)
    if @applicant.save
      redirect_to welcome_profile_path
    else
      render 'new'
    end
  end

  def list
    @applicants = Applicant.all
  end
  
  private
    def applicant_params
      params.require(:applicant).permit(:first_name, :last_name, :email_address, :phone_number, :highest_education, :english_knowledge, :english_class, :payment_option)
    end
end
