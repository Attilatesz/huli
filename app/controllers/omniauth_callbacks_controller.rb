class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google_oauth2
    @user = User.from_omniauth(request.env['omniauth.auth'])
    sign_in @user
    auth = request.env['omniauth.auth']
    session[:email] = auth['info']['email']
    session[:first_name] = auth['info']['first_name']
    session[:last_name] = auth['info']['last_name']
    redirect_to new_applicant_path
  end
end
