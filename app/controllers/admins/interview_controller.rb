class Admins::InterviewController < ApplicationController
  helper_method :get_message
  helper_method :get_name

  def get_message(category)
    Option.where(category: category).pluck(:message)
  end

  def get_name(id)
    Applicant.where(id: id).pluck(:first_name, :last_name)
  end

  def new
    @interview = Interview.new(params[:id])
    @interviews = Interview.all
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
    params[:interview][:start] = DateTime.current
    params.require(:interview).permit(:start, :duration, :applicant_id)
  end
end
