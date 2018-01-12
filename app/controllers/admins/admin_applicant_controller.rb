class Admins::AdminApplicantController < Admins::AdminController
  def dashboard
    @applicants = Applicant.all
  end

  def dashboard_filter
    @applicants = Applicant.where(status: params[:status])
  end

  def status_update
    Applicant.find(params[:applicant_id]).send(params[:status]).send(params[:decision])
    redirect_back fallback_location: root_path
  end

  def show
    @applicant = Applicant.find(params[:id])
    @commentable = Applicant.find(params[:id])
    @comment = Comment.new
  end

  def search
    names = params[:search][:search_term].split(' ').join('|')
    @applicants = Applicant.where('first_name RLIKE ? OR last_name RLIKE ? OR email_address RLIKE ?',
                                  names, names, params[:search][:search_term])
  end
end
