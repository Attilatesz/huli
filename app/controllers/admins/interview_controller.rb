class Admins::InterviewController < ApplicationController

  def edit
    @applicant= Applicant.find(params[:applicant_id])
    @interview = @applicant.interview
  end

  def update
    @interview = Applicant.find(params[:applicant_id]).interview
    if @interview.update(interview_params)
      redirect_to admins_dashboard_path
    else
      render 'edit'
    end
  end

  private

  def interview_params
    params.require(:interview).permit(:start, :applicant_id)
  end
end
