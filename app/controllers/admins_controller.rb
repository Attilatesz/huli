class AdminsController < ApplicationController
  before_action :redirect_unless_admin

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
    @profile_picture = current_user.applicant.profile_picture
  end

  private

    def redirect_unless_admin
      return if current_user && current_user.admin
      flash[:danger] = I18n.t('flash.authentication_error')
      redirect_to root_path
    end
end
