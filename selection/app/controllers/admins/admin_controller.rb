class Admins::AdminController < ApplicationController
  before_action :redirect_unless_admin

  private

  def redirect_unless_admin
    return if current_user && current_user.admin
    flash[:danger] = I18n.t('flash.authentication_error')
    redirect_to root_path
  end
end
