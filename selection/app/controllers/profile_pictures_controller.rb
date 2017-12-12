class ProfilePicturesController < ApplicationController
  def edit
    @user = current_user
    redirect_to root_path unless @user
  end

  def update
    @profile_picture = current_user.profile_picture
    is_update_successful = @profile_picture.update(profile_picture_params)
    @profile_picture.upload if is_update_successful
    redirect_to root_path
  end

  private

    def profile_picture_params
      params.require(:profile_picture).permit(:image)
    end
end
