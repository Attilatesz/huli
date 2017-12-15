class AdminsController < ApplicationController

  def list
    @applicants = Applicant.all
  end

  def show
    @applicant = Applicant.find(1)
  end
end
