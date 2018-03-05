class WelcomeController < ApplicationController
    def index
      @drt = Drt.all
    end

    def profile
      redirect_to root_path unless current_user
    end
end
