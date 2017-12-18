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
      flash[:success] = 'Thank you for uploading your profile picture. We will be in touch with you.'
      @profile_picture.upload
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
      flash[:success] = 'You successfully updated your profile picture.'
      @profile_picture.upload
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
