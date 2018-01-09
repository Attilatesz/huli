class Admins::DrtsController < Admins::AdminController

  def new
    @drt = Drt.new
  end

  def create
    @drt = Drt.create(drt_params)
    if @drt.errors.any?
      render 'new'
    else
      flash[:success] = I18n.t('flash.drt_success')
      redirect_to root_path
    end
  end

private

def drt_params
  params.require(:drt).permit(:drt_hash)
end

end
