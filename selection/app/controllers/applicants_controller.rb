class ApplicantsController < ApplicationController
  helper_method :get_name, :get_name_and_message

  def get_name(category)
    Option.where(category: category).pluck(:name)
  end

  def get_name_and_message(category)
    Option.where(category: category).pluck(:message, :name)
  end

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
