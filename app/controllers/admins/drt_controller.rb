class Admins::DrtController < Admins::AdminController

  def new
    @drt = Drt.new
  end

  def create
    @drt = Drt.create(drt_params)
  end

end
