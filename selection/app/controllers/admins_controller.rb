class AdminsController < ApplicationController

  def list
    @applicants = Applicant.all
  end

  def show
    @applicant = Applicant.find(params[:id])
  end
end
