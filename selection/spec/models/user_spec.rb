require 'rails_helper'

RSpec.describe User, type: :model do
  it 'has a valid factory' do
    expect(build :user).to be_valid
  end

  describe 'invalid' do
    it 'has no email present' do
      expect(build :user, email: nil).to be_invalid
    end

    it 'has no provider present' do
      expect(build :user, provider: nil).to be_invalid
    end

    it 'has no uid present' do
      expect(build :user, uid: nil).to be_invalid
    end
  end

  context '#is_admin' do
    it 'sets admin to true if email end with gmail.com' do
      user = build(:user, email: 'johndoe@gmail.com')
      expect(user.is_admin(user.email)).to eq(true)
    end

    it 'does not sets admin to true if email end not with gmail.com' do
      user = build(:user)
      expect(user.is_admin(user.email)).to eq(false)
    end
  end

  context '#from_omniauth' do
    it 'finds or creates user based on omniauth data' do
      auth = OmniAuth::AuthHash.new({
        provider: 'twitter',
        uid: '123545',
        info: {email: 'johndoe@gmail.com'},
        credentials: {token: '1234564789'}
    })
      expect(User.from_omniauth(auth)).to be_valid
    end
  end

end
