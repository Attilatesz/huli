require 'rails_helper'

RSpec.describe ProfilePicture, type: :model do
  it 'has valid factory' do
    profile_picture = build :profile_picture
    expect(profile_picture).to be_valid
  end
  describe 'invalid' do
    it 'is not valid without applicant' do
      expect(build :profile_picture, applicant: nil).to be_invalid
    end
    it'is not valid without image' do
      expect(build :profile_picture, image: nil).to be_invalid
    end
  end
end