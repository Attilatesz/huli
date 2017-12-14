class AdminsController < ApplicationController
  
  def listApplicants
    @applicant = Applicant.find(:all)
  end
  
end
