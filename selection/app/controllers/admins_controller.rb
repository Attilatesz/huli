class AdminsController < ApplicationController
  before_action :redirect_unless_admin

  def dashboard
    @applicants = Applicant.all
  end

  def dashboard_filter
    @applicants = Applicant.where(status: params[:status])
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
