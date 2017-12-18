class User < ApplicationRecord
  has_one :cv, dependent: :destroy
  has_one :profile_picture, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :rememberable, :trackable,
         :omniauthable, omniauth_providers: [:github, :google_oauth2]



  def self.from_omniauth(auth)
   User.where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
     user.provider = auth.provider
     user.uid = auth.uid
     user.email = auth.info.email if auth.info.email
     user.github_handle = auth.info.nickname
     user.full_name = auth.info.name
     user.access_token = auth.credentials.token
     user.admin = user.is_admin(auth.info.email)
   end
  end

 def is_admin(email)
   email.split("@").last == "greenfox-academy.com"
 end

end
