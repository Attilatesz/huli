class CvsController < ApplicationController

  def new
    @cv = Cv.new
    redirect_to root_path unless current_user
  end

  def create
    @cv = current_user.applicant.create_cv(cv_params)
    if @cv.errors.any?
      render 'new'
    else
      @cv.upload
      flash[:success] = I18n.t('flash.upload_new_success', upload: 'CV')
      redirect_to root_path
    end
  end

  def edit
    @cv = current_user.applicant.cv
    redirect_to new_cv_path unless @cv
  end

  def update
    @cv = current_user.applicant.cv
    if @cv.update(cv_params)
      @cv.upload
      flash[:success] = I18n.t('flash.upload_update_success', upload: 'CV')
      redirect_to root_path
    else
      render 'edit'
    end
  end

  private

    def cv_params
      params.require(:cv).permit(:cv)
    end
end
