class ProfilePicturesController < ApplicationController
  def new
    @profile_picture = ProfilePicture.new
    redirect_to root_path unless current_user
  end

  def create
    @profile_picture = current_user.create_profile_picture(profile_picture_params)
    if @profile_picture.errors.any?
      render 'new'
    else
      @profile_picture.upload
      redirect_to root_path
    end
  end

  def edit
    @profile_picture = current_user.profile_picture
    unless @profile_picture
      redirect_to new_profile_picture_path
    end
  end

  def update
    @profile_picture = current_user.profile_picture.update(profile_picture_params)
    if @profile_picture.errors.any?
      render 'edit'
    else
      @profile_picture.upload
      redirect_to root_path
    end
  end

  private

    def profile_picture_params
      params.require(:profile_picture).permit(:image)
    end
end
