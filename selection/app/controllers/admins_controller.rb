class AdminsController < ApplicationController
  
  def listApplicants
    @applicants = Applicant.find(:all)
  end

end
