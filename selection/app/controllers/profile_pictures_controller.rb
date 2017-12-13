class ProfilePicturesController < ApplicationController
  def new
    redirect_to root_path unless current_user
  end

  def create
    @profile_picture = current_user.create_profile_picture(profile_picture_params)
    unless @profile_picture.errors.any?
      @profile_picture.upload
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

    def profile_picture_params
      params.require(:profile_picture).permit(:image)
    end
end
