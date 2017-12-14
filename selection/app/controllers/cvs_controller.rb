class CvsController < ApplicationController
  def new
    redirect_to root_path unless current_user
  end

  def create
    @cv = current_user.create_cv(cv_params)
    unless @cv.errors.any?
      @cv.upload
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

    def cv_params
      params.require(:cv).permit(:cv)
    end
end
