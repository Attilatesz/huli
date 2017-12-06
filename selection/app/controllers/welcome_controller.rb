class WelcomeController < ApplicationController
    # Krsztian's method name have to be the same --> index, DELETE this comment if it works! :)
    def index
    end

    def profile
			@user = current_user
		end
end
