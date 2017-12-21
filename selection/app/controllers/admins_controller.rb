class AdminsController < ApplicationController
  before_action :redirect_unless_admin

  def dashboard
    @applicants = Applicant.all
  end
  
  def show
    @applicant = Applicant.find(params[:id])
  end

  private
    def redirect_unless_admin
      unless current_user && current_user.admin
        flash[:danger] = I18n.t('flash.authentication_error')
        redirect_to root_path
      end
    end
end
