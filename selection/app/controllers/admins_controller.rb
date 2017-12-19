class AdminsController < ApplicationController
  before_action :redirect_unless_admin

  def list
    @applicants = Applicant.all
  end
  
  def show
    @applicant = Applicant.find(params[:id])
  end

  private
    def redirect_unless_admin
      unless current_user && current_user.admin
        flash[:danger] = 'Authentication error!'
        redirect_to root_path
      end
    end
end
