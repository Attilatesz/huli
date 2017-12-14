class WelcomeController < ApplicationController
  # Krsztian's method name have to be the same --> index, DELETE this comment if it works! :)
  def index
    @user = current_user
  end

  def profile
    @user = current_user
    redirect_to root_path unless @user
  end

  def upload_profile_picture
    @user = current_user
    redirect_to root_path unless @user
  end
end
