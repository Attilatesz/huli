class ProfilePicturesController < ApplicationController
  def edit
    @profile_picture = current_user.profile_picture
    redirect_to root_path unless current_user
  end

  def update
    @profile_picture = current_user.profile_picture
    is_update_successful = @profile_picture.update(profile_picture_params)
    if is_update_successful
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
