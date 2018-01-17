class Admins::InterviewController < ApplicationController

  def new
    @interview = Interview.new
    @applicant_id = params[:applicant_id]
  end

  def create
    @interview = Interview.create(interview_params)
    if @interview.errors.any?
      render 'new'
    else
      redirect_to admins_dashboard_path
    end
  end

  private

  def interview_params
    params.require(:interview).permit(:start, :applicant_id)
  end
end
