class ProfilePicturesController < ApplicationController
  def new
    @profile_picture = ProfilePicture.new
    redirect_to root_path unless current_user
  end

  def create
    @profile_picture = current_user.applicant.create_profile_picture(profile_picture_params)
    if @profile_picture.errors.any?
      render 'new'
    else
      @profile_picture.upload
      flash[:success] = flash[:success] = I18n.t('flash.upload_new_success', upload: 'profile picture')
      redirect_to root_path
    end
  end

  def edit
    @profile_picture = current_user.applicant.profile_picture
    redirect_to new_profile_picture_path unless @profile_picture
  end

  def update
    @profile_picture = current_user.applicant.profile_picture
    if @profile_picture.update(profile_picture_params)
      @profile_picture.upload
      flash[:success] = flash[:success] = I18n.t('flash.upload_update_success', upload: 'profile picture')
      redirect_to root_path
    else
      render 'edit'
    end
  end

  private

    def profile_picture_params
      params.require(:profile_picture).permit(:image)
    end
end
