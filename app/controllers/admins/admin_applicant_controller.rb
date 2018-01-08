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
  end

  def search
    names = search_params
    @applicants = Applicant.find_applicant_by_name_or_email(names, params[:search][:search_term])
  end

  private

  def search_params
    params.require(:search).permit(:search_term)
    params[:search][:search_term].split(' ').join('|')
  end
end
