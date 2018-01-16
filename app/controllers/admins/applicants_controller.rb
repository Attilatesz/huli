class Admins::ApplicantsController < Admins::AdminController
  def dashboard
    @applicants = Applicant.all
  end

  def dashboard_filter
    @applicants = Applicant.where(status: params[:status])
  end

  def status_update
    applicant = Applicant.find(params[:applicant_id])
    applicant.send(params[:status]).send(params[:decision])
    flash[:danger] = applicant.errors.full_messages.first if applicant.errors.any?
    redirect_back fallback_location: root_path
  end

  def show
    @applicant = Applicant.find(params[:id])
    @commentable = Applicant.find(params[:id])
    @comment = Comment.new
    @comments = Comment.where(commentable_id: @applicant.id)
  end

  def search
    @applicants = Applicant.find_applicant_by_name_or_email(search_params, params[:search][:search_term])
  end

  private

  def search_params
    params.require(:search).permit(:search_term)
    params[:search][:search_term].split(' ').join('|')
  end
end
