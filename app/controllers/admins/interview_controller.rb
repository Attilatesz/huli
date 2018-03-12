class Admins::InterviewController < ApplicationController
  helper_method :get_message
  helper_method :get_email

  def get_message(category)
    Option.where(category: category).pluck(:message)
  end

  def get_email
    User.where(admin: 1).pluck(:email)
  end

  def new
    @interview = Interview.new(params[:id])
    @interviews = Interview.all
    @user = get_email
    @message = get_message( 'Interview' )
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
    params.require(:interview).permit(:start, :duration, :applicant_id, :user)
  end
end
