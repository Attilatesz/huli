class Admins::AdminApplicantController < Admins::AdminController
  before_action :redirect_unless_admin

  def dashboard
    @applicants = Applicant.all
  end

  def update_status
    @applicants = Applicant.where(status: params[:status])
  end

  def show
    @applicant = Applicant.find(params[:id])
  end
end
