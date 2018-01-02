class OptionsController < ApplicationController
  before_action :redirect_unless_admin
  before_action :get_category, only: [:index, :new, :edit]

  def index
    @options = Option.where(["category = ?", params[:category]])
  end

  def new
    @option = Option.new
  end

  def edit
    @option = Option.find(params[:id])
  end

  def create
    @option = Option.create(option_params)
    if @option.errors.any?
      render 'new'
    else
      redirect_to list_options_path(category: params[:option][:category])
    end
  end

  def update
    @option = Option.find(params[:id])
    if @option.update(option_params)
      redirect_to list_options_path(category: params[:option][:category])
    else
      render 'edit'
    end
  end

  def destroy
    Option.find(params[:id]).delete
    redirect_to list_options_path(category: params[:category])
  end

  private

  def option_params
    params.require(:option).permit(:category, :name, :message)
  end

  def get_category
    @category = params[:category]
  end

  def redirect_unless_admin
    return if current_user && current_user.admin
    flash[:danger] = I18n.t('flash.authentication_error')
    redirect_to root_path
  end
end
