class ProfilePicturesController < ApplicationController
  def edit
    @user = current_user
    @picture = @user.profile_picture
    redirect_to root_path unless @user
  end

  def update
    puts "ayy"
    redirect_to root_path
  end
end
