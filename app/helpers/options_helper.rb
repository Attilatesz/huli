module OptionsHelper
  def category
    params[:category] || params[:option][:category]
  end
end
