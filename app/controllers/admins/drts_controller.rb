class Admins::DrtsController < Admins::AdminController

  def new
    @drt = Drt.new
  end

  def create
    @drt = drt_params[:drt_hash].split(/\r?\n/).each {|hash| Drt.create(drt_hash: hash)}
    flash[:success] = I18n.t('flash.drt_success')
    redirect_to root_path
  end

private

def drt_params
  params.require(:drt).permit(:drt_hash)
end

end
