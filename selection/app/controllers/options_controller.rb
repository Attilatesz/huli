class OptionsController < ApplicationController
  before_action :redirect_unless_admin

  def index
    @options = Option.where(["category = ?", params[:category]])
  end

  def new
    @category = params[:category]
    @option = Option.new
  end

  def create
    @option = Option.create(option_params)
    if @option.errors.any?
      render 'new'
    else
      redirect_to options_path(option_params)
    end
  end

  private

    def option_params
      params.require(:option).permit(:category, :name, :message)
    end

    def redirect_unless_admin
      return if current_user && current_user.admin
      flash[:danger] = I18n.t('flash.authentication_error')
      redirect_to root_path
    end
end
