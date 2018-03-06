class Admins::InterviewController < ApplicationController
  helper_method :get_message

  def get_message(category)
    Option.where(category: category).pluck(:message)
  end

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

  def show
    @interviews = Interview.all
  end

  private

  def interview_params
    params[:interview][:start] = DateTime.current
    params.require(:interview).permit(:start, :message, :applicant_id)
  end
end
