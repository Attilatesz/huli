class Admins::InterviewController < ApplicationController

  def new
    @interview = Interview.new(params[:id])
  end

  def create
    @interview = Interview.new(params[:id])
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
    params[:interview][:start] = Date.strptime(params[:interview][:start], '%m/%d/%Y/%H/%m/%s')
    params.require(:interview).permit(:start)
  end
end
