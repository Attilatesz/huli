class CvsController < ApplicationController
  def new
    @cv = Cv.new
    redirect_to root_path unless current_user
  end

  def create
    @cv = current_user.create_cv(cv_params)
    if @cv.errors.any?
      render 'new'
    else
      flash[:success] = 'Thank you for uploading your CV. We will be in touch with you.'
      @cv.upload
      redirect_to root_path
    end
  end

  def edit
    @cv = current_user.cv
    redirect_to new_profile_picture_path unless @cv
  end

  def update
    @cv = current_user.cv.update(cv_params)
    if @cv.errors.any?
      render 'edit'
    else
      @cv.upload
      redirect_to root_path
    end
  end

  private

    def cv_params
      params.require(:cv).permit(:cv)
    end
end
