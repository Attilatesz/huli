class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def github
    @user = User.from_omniauth(request.env['omniauth.auth'])
    sign_in_and_redirect @user
    puts request.env['omniauth.auth']
  end

end
