class AdminsController < ApplicationController
  
  def list
    @applicants = Applicant.all
  end

end
