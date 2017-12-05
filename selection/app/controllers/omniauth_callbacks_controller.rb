require 'pp'
class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def github
    @user = User.from_omniauth(request.env['omniauth.auth'])
    pp request.env['omniauth.auth']
    sign_in_and_redirect @user
  end

end
