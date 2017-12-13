class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def github
    @user = from_omniauth(request.env['omniauth.auth'])
    sign_in_and_redirect @user
  end

  private

    def from_omniauth(auth)
      User.where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.provider = auth.provider
        user.uid = auth.uid
        user.email = auth.info.email if auth.info.email
        user.github_handle = auth.info.nickname
        user.full_name = auth.info.name
        user.access_token = auth.credentials.token
        user.create_profile_picture
      end
    end
end
