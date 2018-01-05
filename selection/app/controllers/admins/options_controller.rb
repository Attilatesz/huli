class Admins::OptionsController < Admins::AdminController
  include OptionsHelper

  def filter
    @options = Option.where(['category = ?', category])
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
      redirect_to filter_admins_options_path(category: category)
    end
  end

  def update
    @option = Option.find(params[:id])
    if @option.update(option_params)
      redirect_to filter_admins_options_path(category: category)
    else
      render 'edit'
    end
  end

  def destroy
    Option.find(params[:id]).delete
    redirect_to filter_admins_options_path(category: category)
  end

  private

  def option_params
    params.require(:option).permit(:category, :name, :message)
  end
end
