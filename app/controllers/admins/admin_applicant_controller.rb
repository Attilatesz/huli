class Admins::AdminApplicantController < Admins::AdminController
  def dashboard
    @applicants = Applicant.all
  end

  def dashboard_filter
    @applicants = Applicant.where(status: params[:status])
  end

  def show
    @applicant = Applicant.find(params[:id])
  end

  def search
    names = params[:search][:search_term].split(' ').join('|')
    @applicants = Applicant.where('first_name RLIKE ? OR last_name RLIKE ? OR email_address RLIKE ?',
                                  names, names, params[:search][:search_term])
  end
end
