class Admins::InterviewController < ApplicationController

  def new
    @interview = Interview.new(params[:id])
  end

  def create
    @interview = Interview.new(interview_params)
    @interview.save
    redirect_to root_path
  end

  def edit
    @interview = Interview.find(params[:id])
  end

  def update
    @interview = Interview.find(params[:id])
    if @interview.update(interview_params)
      redirect_to admins_dashboard_path
    else
      render 'edit'
    end
  end

  private

  def interview_params
    params[:interview][:start] = Date.strptime('2001-02-03', '%Y-%m-%d')
    params.require(:interview).permit(:start, :duration, :applicant_id)
  end
end
